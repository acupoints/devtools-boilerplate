### https://github.com/tianocore/tianocore.github.io/wiki/UDK2015

### UDK2015.MyWorkSpace.zip Extract here
### BaseTools(Windows).zip Extract files... MyWorkSpace
### C:\MyWorkSpace\CryptoPkg\Library\OpensslLib
tar -xzfv openssl-1.0.2d.tar.gz
cd openssl-1.0.2d
patch -p0 -i ..\EDKII_openssl-1.0.2d.patch
cd ..
Install.cmd

### Run the simulator
set PYTHON_HOME=C:\Python37
edksetup.bat --nt32

build -t VS2013x86
build run

