pip install virtualenvwrapper
mkvirtualenv my_flask_env

export FLASK_APP=my_app
export WORKON_HOME=~/workspace
source virtualenvwrapper.sh
workon my_flask_env


deactive
pip install Werkzeug==0.16.1
pip install Werkzeug==1.0.1

