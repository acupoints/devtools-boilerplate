### https://github.com/tianocore/tianocore.github.io/wiki/UDK2015

### UDK2015.MyWorkSpace.zip Extract here
### BaseTools(Windows).zip Extract files... MyWorkSpace
### C:\MyWorkSpace\CryptoPkg\Library\OpensslLib
### openssl-1.0.2d.tar.gz 解压到当前目录
cd openssl-1.0.2d
patch -p0 -i ..\EDKII_openssl-1.0.2d.patch
cd ..
Install.cmd

### Run the simulator
set CYGWIN_HOME=C:\MyWorkSpace\BaseTools\Bin\CYGWIN_NT-5.1-i686
set PYTHON_HOME=C:\Python37
edksetup.bat --nt32

build -t VS2013x86
build run

## UGA Window 1
## UGA Window 2
########################################
## 请单击桌面切换至系统自带的英文输入法，然后单击UGA窗口进行输入
## UGA窗口无法解析复制的输入，实测百度五笔切换到英文也不支持
## 推荐使用微软拼音，切换到英文模式
Shell> fs0:
FS0:\> dir h*
FS0:\> Hello{TAB}
UEFI Hello World!
FS0:\> 

