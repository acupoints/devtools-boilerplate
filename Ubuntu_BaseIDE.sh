## Install pyenv
apt update -y
apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
git

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"
pyenv install --list
pyenv install 3.7.6
pyenv versions
pyenv global 3.7.6

## Install ruby
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`

rvm list known
rvm install 2.6.5
rvm list
rvm use 2.6.5

## Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm -v
nvm install 12
nvm use 12

node --version
npm --version
npm install -g yarn
yarn --version
