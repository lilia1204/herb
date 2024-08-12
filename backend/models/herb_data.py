from sqlalchemy.orm import relationship

from db_init import db_init as db


class HerbData(db.Model):
    __tablename__ = 'herb_data'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    image = db.Column(db.String(255), nullable=False)
    introduction = db.Column(db.Text, nullable=False)

    # 定义与Record的关系
    records = relationship("Record", back_populates="herb")

#   将模型实例转换为字典，但不包括ID
    def to_dict_without_id(self):
        data = {column.name: getattr(self, column.name) for column in self.__table__.columns if column.name != 'id'}
        #print(data)
        return data

#   将模型实例转换为字典，包括预测概率值
    def to_dict_add_probability(self, probability):
        return {
            'id': self.id,
            'name': self.name,
            'image': self.image,
            'introduction': self.introduction,
            'probability': str(probability)
        }
