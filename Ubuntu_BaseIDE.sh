## Set administrator password
sudo passwd root
su root

## Install common tools
apt install -y git vim curl

## Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

apt update -y
apt install -y liblzma-dev libffi-dev tk-dev xz-utils libncursesw5-dev libncurses5-dev llvm libsqlite3-dev \
libreadline-dev libbz2-dev zlib1g-dev libssl-dev build-essential make libffi-dev openssl libssl-dev \
tk-dev libsqlite3-dev zlib1g-dev libc6-dev libgdbm-dev libncursesw5-dev build-essential \
python-smbus python-pip python-setuptools python-dev build-essential

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

