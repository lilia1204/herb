import json
from flask import Blueprint, request, jsonify
from services import admin as s_admin

admin = Blueprint('admin', __name__)


@admin.route('/login', methods=['POST', 'OPTIONS'])
def login():
    if request.method == 'OPTIONS':
        # 处理预检请求
        response = jsonify()
        response.headers.add("Access-Control-Allow-Origin", "*")
        response.headers.add("Access-Control-Allow-Headers", "Content-Type,Authorization")
        response.headers.add("Access-Control-Allow-Methods", "POST,OPTIONS")
        return response
    data = json.loads(request.data)
    user_id = data['user_id']
    password = data['password']
    result = s_admin.login(user_id, password)
    return result
