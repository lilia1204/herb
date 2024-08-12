import json
from flask import Blueprint, request
from services import user as s_user

user = Blueprint('user', __name__)


@user.route('/getInfo', methods=['POST'])
def getInfo():
    data = json.loads(request.data)
    code = data['code']
    result = s_user.getInfo(code)
    return result


@user.route('/changeInfo', methods=['POST'])
def changeInfo():
    openid = request.form.get('openid')
    name = request.form.get('nickName')
    image = request.files['file']
    result = s_user.changeInfo(openid, name, image)
    return result


@user.route('/changeNickName', methods=['POST'])
def changeNickName():

    data = json.loads(request.data)
    print(data)
    openid = data['openid']
    name = data['nickName']

    result = s_user.changeNickName(openid, name)
    # return '1'
    return result


