## Set administrator password
sudo passwd root
su root

## Install common tools
rm -rf /var/lib/dpkg/lock
apt install -y vim make git curl

## Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo -e '\n# Add PYENV to PATH for scripting.' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

apt update -y
apt install -y build-essential libbz2-dev libc6-dev libffi-dev libgdbm-dev liblzma-dev \
libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev llvm make \
openssl python-dev python-pip python-setuptools python-smbus sqlite3 \
tk-dev xz-utils zlib1g-dev

## Install the specified version
pyenv install --list
pyenv install 3.7.6
pyenv versions
pyenv global 3.7.6

## Install ruby
### This method requires turning over the wall
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
git clone https://github.com/rvm/rvm.git
cat rvm/binscripts/rvm-installer | sudo bash -s stable

echo source /usr/local/rvm/scripts/rvm >> ~/.bashrc

source ~/.bashrc
rvm --version

rvm list known
rvm list known | grep 2.6
rvm install 2.6.5
rvm list
rvm use 2.6.5 --default

gem --version
bundle --version
gem install rails
rails --version

## Install nvm
git clone https://github.com/nvm-sh/nvm.git
cat nvm/install.sh | sudo bash

source ~/.bashrc
nvm --version

nvm ls-remote
nvm ls-remote | grep v12.16
nvm install v12.16
nvm ls
nvm use v12.16

node --version
npm --version
npm install -g yarn
yarn --version

### Install Visual Studio Code
###################################################
wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i code_*_amd64.deb
# rm -rf code_*_amd64.deb

### Install Chrome
###################################################
wget --content-disposition https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
# rm -rf google-chrome-stable_current_amd64.deb

wget --content-disposition https://dl.pstmn.io/download/latest/linux64
tar -xzvf Postman-linux-x64-7.27.1.tar.gz
## ln [OPTION]... TARGET... DIRECTORY
## -s, --symbolic              make symbolic links instead of hard links
ln -s ./Postman/Postman /usr/bin/

