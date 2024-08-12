from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

from db_init import db_init as db


class Record(db.Model):
    __tablename__ = 'record'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    herb_id = db.Column(db.Integer, ForeignKey('herb_data.id'), nullable=False)
    user_id = db.Column(db.String(255), db.ForeignKey('user.id'), nullable=False)
    date = db.Column(db.DateTime, nullable=False)

    # 定义与HerbData的关系
    herb = relationship("HerbData", back_populates="records")

    def to_dict(self):
        return {
            'id': self.id,
            'user_id':self.user_id,
            'herb_id': self.herb_id,
            'date': self.date
        }
