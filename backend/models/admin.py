from db_init import db_init as db

class Admin(db.Model):
    __tablename__ = 'admin'
    id = db.Column(db.String(255), primary_key=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    token = db.Column(db.String(255))

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'password': self.password,
            'token':self.token
        }

    def to_dict_without_password(self):
        return {
            'id':self.id,
            'name': self.name,
            'token':self.token
        }