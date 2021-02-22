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
build -t VS2013x86 -b RELEASE
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

===================================
## 设置32位edk开发环境
edksetup.bat --nt32

## 运行32位模拟器，打包64位的efi应用是无法正常使用的
build -a IA32 run

## 真机需要打包64位的efi应用，32位的efi程序无法正常执行
## 已打包的efi应用不会重新打包，需要清理打包目录
build -p MdeModulePkg\MdeModulePkg.dsc -m MdeModulePkg\Application\HelloWorld\HelloWorld.inf -a X64
build -p MdeModulePkg\MdeModulePkg.dsc -m MdeModulePkg\Application\HelloWorld\HelloWorld.inf -a IA32

build -p MdeModulePkg\MdeModulePkg.dsc -m MdeModulePkg\Application\MemoryProfileInfo\MemoryProfileInfo.inf -a X64
build -p MdeModulePkg\MdeModulePkg.dsc -m MdeModulePkg\Application\MemoryProfileInfo\MemoryProfileInfo.inf -a IA32

