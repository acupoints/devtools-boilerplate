django-admin startproject django_server
cd django_server/
ls -al

django-admin startapp apis
ls -al

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --email 1448991007@qq.com --username admin
ls -al

cd apis/
ls -al

mkdir -p templates

## django_server/settings.py
INSTALLED_APPS = [
    # 'django.contrib.admin',
    # 'django.contrib.auth',
    # 'django.contrib.contenttypes',
    # 'django.contrib.sessions',
    # 'django.contrib.messages',
    # 'django.contrib.staticfiles',
    'apis',
]

## django_server/settings.py
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "apis/templates/static"),
    os.path.join(BASE_DIR, "apis/templates"),
    # All static resources must add directory fragment /static
]
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
# SECURE_SSL_REDIRECT = True
import django_heroku
django_heroku.settings(locals())

## Solve the problem that Django React cannot find /favicon.ico
## django_server\urls.py
from django.contrib import admin
from django.urls import path
from apis import views as apis_views
## Solve the problem that Django React cannot find /favicon.ico
from django.contrib.staticfiles.views import serve

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', apis_views.hello),
    ## Solve the problem that Django React cannot find /favicon.ico
    path('/favicon.ico', serve, {'path': '/static/favicon.ico'}),
    path('/logo192.png', serve, {'path': '/static/logo192.png'}),
]


npx create-react-app react_client
cd react_client/
ls -al
rm -rf .git

yarn eject

## react_client/config/paths.js
module.exports = {
  dotenv: resolveApp('.env'),
  appPath: resolveApp('.'),
  // appBuild: resolveApp('build'),
  appBuild: resolveApp('../templates'),
  // ...
}

## react_client/public/index.html
    <!-- <link rel="manifest" href="%PUBLIC_URL%/manifest.json" /> -->

yarn build


## Load home page
## apis/views.py
def hello(request):
    return render(request, 'index.html')

## django_server/urls.py
from apis import views as apis_views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', apis_views.hello),
]

## Configure the external environment
## Create 4 required files
touch .gitignore
echo apis/__pycache__/>>.gitignore
echo apis/migrations/>>.gitignore
echo django_server/__pycache__/>>.gitignore
echo apis/react_client/node_modules/>>.gitignore

touch runtime.txt
echo python-3.7.6>>runtime.txt

touch requirements.txt
echo django>>requirements.txt
echo gunicorn>>requirements.txt
echo django-heroku>>requirements.txt
echo requests>>requirements.txt

touch Procfile
echo web: gunicorn django_server.wsgi --log-file ->>Procfile

touch Procfile.windows
echo web: python manage.py runserver 0.0.0.0:5000>>Procfile.windows

