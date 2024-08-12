from models.herb_data import HerbData
from flask import jsonify
from services.record import add_record


def identify(classifier, image, openid):
    class_name, probability = classifier.TCMclassify(image)
    print(class_name)
    herb = HerbData.query.filter_by(name=class_name).first()
    print(herb)
    if herb is None:
        return jsonify({'code': -1, 'message': '药材不存在', 'data': {}})

    herb_dict = herb.to_dict_add_probability(probability)

    add_record(openid, herb_dict['id'])
    return jsonify({'code': 0, 'message': '识别成功', 'data': herb_dict})


def getList():
    herb_datas = HerbData.query.all()
    if len(herb_datas) < 15:
        return jsonify({'code': -1, 'message': '数据库数据缺失', 'data': {}})

    herb_data_dicts = [herb.to_dict_without_id() for herb in herb_datas]
    print(herb_data_dicts)

    for dict in herb_data_dicts:
        if dict['name'] is None or dict['introduction'] is None:
            return jsonify({'code': -1, 'message': '数据库数据缺失', 'data': {}})

    return jsonify({'code': 0, 'message': '获取药材信息列表成功', 'data': herb_data_dicts})
