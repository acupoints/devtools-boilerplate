## Set administrator password
sudo passwd root
su root

## Install common tools
apt install -y vim make git curl

## Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo '\n# Add RVM to PATH for scripting. Make sure this is not the last PATH variable change.' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

apt update -y
apt install -y build-essential libbz2-dev libc6-dev libffi-dev libgdbm-dev liblzma-dev \
libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev llvm make \
openssl python-dev python-pip python-setuptools python-smbus sqlite3 \
tk-dev xz-utils zlib1g-dev

pyenv install --list
pyenv install 3.7.6
pyenv versions
pyenv global 3.7.6

## Install ruby
### This method requires turning over the wall
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# Install only RVM
\curl -sSL https://get.rvm.io | bash -s stable
# For installing RVM with default Ruby and Rails in one command, run
\curl -sSL https://get.rvm.io | bash -s stable --rails

### Recommended installation, no need to turn the wall
########################################################################
git clone https://github.com/rvm/rvm.git
cat rvm/binscripts/rvm-installer | sudo bash -s stable
echo source ~/.rvm/scripts/rvm >> ~/.bashrc

source ~/.bashrc
rvm --version

rvm list known
rvm list known | grep 2.6
rvm install 2.6.5
rvm list
# 临时设置，重新打开终端不可用
# rvm use 2.6.5
rvm use 2.6.5 --default

gem --version
bundle --version
gem install rails
rails --version

## Install nvm
### This method requires turning over the wall
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

### Recommended installation, no need to turn the wall
########################################################################
git clone https://github.com/nvm-sh/nvm.git
cat nvm/install.sh | sudo bash

source ~/.bashrc
nvm --version

nvm ls-remote
# nvm ls-remote v12.16
nvm ls-remote | grep v12.16
nvm install v12.16
nvm ls
nvm use v12.16

node --version
npm --version
npm install -g yarn
yarn --version

/**
* Generate SSH keys and add it to github or gitlab
*/
### STEP 01
ssh-keygen -t rsa -C "lanbinzheng@foxmail.com" -b 4096
{ENTER}{ENTER}{ENTER}

### STEP 02
cat ~/.ssh/id_rsa.pub | clip
{ENTER}

### STEP 03
ssh -T git@github.com
{yes}{ENTER}

## ------------------------------
ssh -T git@github.com
{yes}{ENTER}

===
$ ssh -T git@github.com
Hi acupoints! You've successfully authenticated, but GitHub does not provide shell access.

[控制面板][用户帐户][凭据管理器][Windows 凭据]
git:https://github.com
(删除)_

