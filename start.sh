#!/bin/bash
# 从第一行到最后一行分别表示：
# 1. 生成数据库迁移文件
# 2. 根据数据库迁移文件来修改数据库
# 3. 用 uwsgi启动 django 服务, 不再使用python manage.py runserver
# while ! nc -z db 3306 ; do   # TODO db找不到
while ! nc -z 42.192.53.215 3306 ; do
    echo "Waiting for the MySQL Server"
    sleep 3
done
python3 manage.py collectstatic --noinput&&
python3 manage.py makemigrations&&
python3 manage.py migrate&&
uwsgi --ini ./uwsgi.ini&&
tail -f /dev/null

exec "$@"
# python manage.py runserver 0.0.0.0:8000