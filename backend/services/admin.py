import os
from db_init import db_init
from flask import jsonify
from models.admin import Admin


def login(user_id, password):
    adm = Admin.query.filter_by(id=user_id).first()
    if adm is None:
        return jsonify({'code': -1, 'message': '账号不存在', 'data': {}})

    adm_dict = adm.to_dict()
    print(adm_dict)
    if adm_dict['password'] != password:
        return jsonify({'code': -2, 'message': '密码错误', 'data': {}})

    random_bytes = os.urandom(16)
    hex_str = random_bytes.hex()
    adm.token = hex_str
    db_init.session.commit()

    re_dict = adm.to_dict_without_password()
    return jsonify({'code': 0, 'message': '登录成功', 'data': re_dict})
