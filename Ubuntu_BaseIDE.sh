## Set administrator password
sudo passwd root
su root

## Install common tools
apt install -y vim make git curl

## Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
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
git clone https://github.com/rvm/rvm.git
cat rvm/binscripts/rvm-installer | sudo bash -s stable
source ~/.bashrc
rvm --version

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

/**
*Add GitLab and SSH keys.txt
*/
### MINGW64:PROJECT NAME
=================================
ssh-keygen -t rsa -C "lanbinzheng@foxmail.com" -b 4096
{ENTER}{ENTER}{ENTER}
cat ~/.ssh/id_rsa.pub | clip
{ENTER}
ssh -T git@gitlab.com
{yes}{ENTER}

===
$ ssh -T git@github.com
Hi acupoints! You've successfully authenticated, but GitHub does not provide shell access.

[控制面板][用户帐户][凭据管理器][Windows 凭据]
git:https://github.com
(删除)_

