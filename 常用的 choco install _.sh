PS Admin> curl -O https://chocolatey.org/install.ps1
PS Admin> iex .\install.ps1
PS Admin> choco --version
## Win7可以考虑升级到PowerShell5.1之后，再进行安装
### STEP 01
https://www.microsoft.com/en-in/download/details.aspx?id=42642
进入页面，单击 Download 直接下载 NDP452-KB2901907-x86-x64-AllOS-ENU.exe 安装即可。
### STEP 02
https://www.microsoft.com/en-us/download/details.aspx?id=54616
进入页面，单击 Download 转到下载页面，选择 [+] Win7AndW2K8R2-KB3191566-x64.zip,单击 Next 下载压缩包
解压之后仅安装 Win7AndW2K8R2-KB3191566-x64.msu 即可。
###

choco install vagrant
choco install virtualbox

# Install PostgreSQL 12.3
# choco install postgresql12 --version=12.3
# cinst postgresql12 --params '/Password:test'
choco install postgresql12 --version=12.3 --params '/Password:Umph2014'
refreshenv


