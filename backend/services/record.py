from db_init import db_init as db
from models.herb_data import HerbData
from flask import jsonify
from models.record import Record
from models.admin import Admin
from datetime import datetime, timedelta
from models.user import User


# 添加记录
def add_record(user_id, herb_id):
    date = datetime.now()
    print(date)
    new_record = Record(
        user_id=user_id,
        herb_id=herb_id,
        date=date
    )

    try:
        # 将记录添加到数据库
        db.session.add(new_record)
        db.session.commit()
        return jsonify({'code': 0, 'message': '记录添加成功'})
    except Exception as e:
        db.session.rollback()
        return jsonify({'code': -1, 'message': '数据库错误', 'error': str(e)})


# 管理员端获取信息
def get_data(user_id, token):
    adm = Admin.query.filter_by(id=user_id).first()
    if adm is None:
        return jsonify({'code': -1, 'message': '账号不存在', 'data': {}})

    adm_dict = adm.to_dict()
    print(adm_dict)
    if adm_dict['token'] != token:
        return jsonify({'code': -2, 'message': 'token失效', 'data': {}})

    user_num = User.query.count()
    print(user_num)

    his_query_num = Record.query.count()
    print(his_query_num)

    today_start = datetime.now().replace(hour=0, minute=0, second=0, microsecond=0)
    today_end = today_start + timedelta(days=1) - timedelta(microseconds=1)
    to_query_num = Record.query.filter(Record.date.between(today_start, today_end)).count()
    print(to_query_num)

    five_days_query_num = get_daily_record_counts(n_days=5)
    print(five_days_query_num)
    five_day={
        'labels':[],
        'data':[]
    }
    for i in five_days_query_num:
        five_day['labels'].append(i)
        five_day['data'].append(five_days_query_num[i])


    records = db.session.query(HerbData.name.label('class_name'), db.func.count(Record.id).label('num')). \
        join(Record, HerbData.id == Record.herb_id).group_by(HerbData.name).all()

    # 将结果转换为字典列表

    re={
        'lable':[],
        'data':[]
    }
    for row in records:
        re['lable'].append(row.class_name)
        re['data'].append(row.num)


    re_dict = get_data_to_dict(user_num, his_query_num, to_query_num, five_day, re)
    return jsonify({'code': 0, 'message': '获取数据成功', 'data': re_dict})


def get_data_to_dict(user_num, his_query_num, to_query_num, five_days_query_num, record):
    return {
        "user_num": user_num,
        "his_query_num": his_query_num,
        "to_query_num": to_query_num,
        "five_days_query_num": five_days_query_num,
        "record": record
    }


def get_daily_record_counts(n_days=5):
    # 获取当前日期
    today = datetime.now().date()
    # 生成日期范围
    date_range = [today - timedelta(days=i) for i in range(n_days)]

    # 初始化一个字典来存储每天的记录数
    daily_counts = {date.isoformat(): 0 for date in date_range}
    print(daily_counts)
    # 对每个日期执行查询
    for i, date in enumerate(date_range):
        # 计算这一天的开始和结束时间（在这个例子中，我们只需要开始时间）
        day_start = datetime(date.year, date.month, date.day)
        day_end = day_start + timedelta(days=1) - timedelta(microseconds=1)

        count = Record.query.filter(
            Record.date >= day_start,
            Record.date < day_end
        ).count()

        daily_counts[date.isoformat()] += count

    return daily_counts
