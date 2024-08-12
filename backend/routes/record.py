import json
from flask import Blueprint, request
from services import record as s_record


record = Blueprint('record', __name__)


@record.route('/get_data', methods=['POST'])
def get_data():
    data = json.loads(request.data)
    user_id = data['user_id']
    token = data['token']
    result = s_record.get_data(user_id, token)
    return result


