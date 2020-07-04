## 查看系统自带python各版本的文件及目录
ls -al /usr/bin/ | grep python

### 样例输出
############################################################################################################
gullies@gullies-VirtualBox:~$ ls -al /usr/bin/ | grep python
lrwxrwxrwx  1 root root          26 3月  28 07:42 dh_pypy -> ../share/dh-python/dh_pypy
-rwxr-xr-x  1 root root        1056 11月 24  2017 dh_python2
lrwxrwxrwx  1 root root          29 3月  28 07:42 dh_python3 -> ../share/dh-python/dh_python3
lrwxrwxrwx  1 root root          23 3月  28 07:42 pdb2.7 -> ../lib/python2.7/pdb.py
lrwxrwxrwx  1 root root          23 3月  28 07:42 pdb3.5 -> ../lib/python3.5/pdb.py
lrwxrwxrwx  1 root root          31 3月  28 07:42 py3versions -> ../share/python3/py3versions.py
lrwxrwxrwx  1 root root          26 3月  28 07:42 pybuild -> ../share/dh-python/pybuild
lrwxrwxrwx  1 root root           9 3月  28 07:42 python -> python2.7
lrwxrwxrwx  1 root root           9 3月  28 07:42 python2 -> python2.7
-rwxr-xr-x  1 root root     3492656 12月  5  2017 python2.7
lrwxrwxrwx  1 root root           9 3月  28 07:42 python3 -> python3.5
-rwxr-xr-x  1 root root     4464400 11月 29  2017 python3.5
-rwxr-xr-x  1 root root     4464400 11月 29  2017 python3.5m
lrwxrwxrwx  1 root root          10 3月  28 07:42 python3m -> python3.5m
lrwxrwxrwx  1 root root          29 3月  28 07:42 pyversions -> ../share/python/pyversions.py
gullies@gullies-VirtualBox:~$ 
############################################################################################################

## 如若没有卸载过python就不会有相关文件看不到
## 重建丢失的文件dh_python2
sudo cp /usr/share/dh-python/dh_python2 /usr/bin/

## 重建及删除python的默认版本
sudo ln -s /usr/bin/python3.7/bin/python3.7 /usr/bin/python3.7.6
sudo rm -rf /usr/bin/python3.7.6

## 删除及重建python的默认版本
sudo rm -rf /usr/bin/python
sudo ln -s python2.7 /usr/bin/python

### 下载
cd Desktop/
wget https://www.python.org/ftp/python/3.7.8/Python-3.7.8.tgz
wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tgz

### 解压
tar xzvf Python-3.7.8.tgz
tar xzvf Python-3.7.6.tgz

### 配置
cd Python-3.7.8/
ls /usr/local | grep python
./configure --prefix=/usr/local/python3.7.8
sudo make && sudo make install
ls /usr/local | grep python

# cd Python-3.7.6
cd ../Python-3.7.6/
./configure --prefix=/usr/local/python3.7.6
sudo make && sudo make install
ls /usr/local | grep python

### 编译过的程序分别存放在指定的路径中
gullies@gullies-VirtualBox:~/Desktop$ ls /usr/local | grep python
python3.7.6
python3.7.8

### 删除源码压缩包及解压目录
### 不熟悉命令的用法推荐输入完整文件或者目录名，安全起见，请两次确保工作目录是哪个
sudo rm -rf Python-3.7.*
