## Set administrator password
su root

## Install common tools
yum install -y vim make git curl
yum install -y gcc make patch gdbm-devel openssl-devel sqlite-devel readline-devel zlib-devel bzip2-devel

## Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo -e '\n# Add PYENV to PATH for scripting.' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

## Install the specified version
pyenv install --list
pyenv install 3.7.6
pyenv versions
pyenv global 3.7.6
