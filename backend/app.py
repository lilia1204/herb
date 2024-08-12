from db_init import app
from routes.record import record
from routes.admin import admin
from routes.user import user
from routes.herb import herb


# 路由设置
# 健康检查路由
@app.route('/')
def ping():
    return 'ok'


app.register_blueprint(record, url_prefix="/record")
app.register_blueprint(admin, url_prefix="/admin")
app.register_blueprint(user, url_prefix='/user')
app.register_blueprint(herb, url_prefix='/herb')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
