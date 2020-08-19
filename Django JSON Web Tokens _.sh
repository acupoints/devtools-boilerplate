django-admin startproject geeksforgeeks
python manage.py startapp apis
pip install django django-rest-framework django-cors-headers
pip install django-filter

python manage.py makemigrations
python manage.py migrate
python manage.py runserver

pip install djangorestframework
pip install djangorestframework-simplejwt
##
pip install django
pip install djangorestframework
pip install django-filter
pip install djangorestframework-simplejwt
pip install psycopg2

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
pip freeze > requirements.txt
python manage.py makemigrations
python manage.py migrate

python manage.py runserver
# Configure the Python virtual environment
python3 -m venv venv
source venv/bin/activate

# Install packages
pip install -r requirements.txt
# Run Django migrations
python manage.py migrate
# Create Django superuser (follow prompts)
python manage.py createsuperuser
# Run the dev server
python manage.py runserver



REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
       'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
    ),
}

REST_FRAMEWORK = {
    'DEFAULT_RENDERER_CLASSES': (
        'rest_framework.renderers.JSONRenderer',
    )
}
