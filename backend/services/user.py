import os

import requests
from flask import jsonify
from models.user import User
from config import config
from db_init import db_init


def get_openid(code):
    grant_type = "authorization_code"  # 这个固定
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + config.appid + "&secret=" + config.appSecret + "&js_code=" + code + "&grant_type=" + grant_type

    user_info = requests.get(url).json()

    openid = user_info['openid']  # 用户openid
    return openid


def getInfo(code):
    if not code:
        return jsonify({'code': -1, 'message': '未发送用户code', 'status': -1, 'data': {}})
    openid = get_openid(code)
    user_data = User.query.filter_by(id=openid).first()
    if user_data is None:
        cur_user = User(id=openid, name='微信用户',
                        image='/static/default.jpg')  # 假设这里根据username来插入，如果需要根据id，请调整逻辑
        db_init.session.add(cur_user)
        db_init.session.commit()
        cur_user = cur_user.to_dict()

    else:
        cur_user = user_data.to_dict()
    return jsonify({'code': 0, 'message': 'sucess', 'status': 1, 'data': cur_user})


def changeInfo(id, name=None, image=None):
    if not id:
        return jsonify({'code': -1, 'message': '未发送用户id', 'data': {}})
    user_data = User.query.filter_by(id=id).first()
    if user_data is None:
        return jsonify({'code': -2, 'message': '用户不存在', 'data': {}})
    if not name and image.filename == '':
        return jsonify({'code': -3, 'message': '没有传入要更新的昵称或头像', 'data': {}})

    if name:
        user_data.name = name
        db_init.session.commit()

    if image.filename != '':
        filename = id + '.jpg'
        # filepath = os.path.join(app.config['IMAGE_UPLOAD_FOLDER'], filename)


        user_data.image = '/static/' + filename
        if os.path.exists(user_data.image):
            # 如果文件存在，删除文件
            os.remove(user_data.image)
        image.save('./static/' + filename)
        db_init.session.commit()

    user_dict = User.query.filter_by(id=id).first().to_dict()
    return jsonify({'code': 0, 'message': '更新成功', 'data': user_dict})


def changeNickName(id, name=None,):
    user_data = User.query.filter_by(id=id).first()
    if name:
        user_data.name = name
        db_init.session.commit()
    return jsonify({'code': 0, 'message': 'success', 'status': 1, 'data': {}})
