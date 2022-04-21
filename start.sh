
python3 manage.py makemigrations&&
python3 manage.py migrate&&
uwsgi --ini ./uwsgi.ini&&
tail -f /dev/null

exec "$@"