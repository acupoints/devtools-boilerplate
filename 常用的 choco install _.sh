PS Admin> curl -O https://chocolatey.org/install.ps1
PS Admin> iex .\install.ps1
PS Admin> choco --version
## Win7可以考虑升级到PowerShell5.1之后，再进行安装
## 安装NDP452-KB2901907-x86-x64-AllOS-ENU.exe
## 解压Win7AndW2K8R2-KB3191566-x64.zip之后，安装Win7AndW2K8R2-KB3191566-x64.msu
###

choco install vagrant

# Install PostgreSQL 12.3
# choco install postgresql12 --version=12.3
# cinst postgresql12 --params '/Password:test'
choco install postgresql12 --version=12.3 --params '/Password:Umph2014'
refreshenv


