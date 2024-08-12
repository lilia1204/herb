from flask import Blueprint, request
from services import herb as s_herb
from AI.classify import classify
import os

herb = Blueprint('herb', __name__)

# 初始化分类器
current_directory = os.getcwd()
combined_path = os.path.join(current_directory, 'AI/herbal_classifier.mod')
classifier = classify(module_file=combined_path)


@herb.route('/identify', methods=['POST'])
def identify():
    file = request.files['image']
    openid = request.form.get('openid')
    result = s_herb.identify(classifier, file,openid)
    return result


@herb.route('/getList', methods=['GET'])
def getList():
    result = s_herb.getList()
    return result
