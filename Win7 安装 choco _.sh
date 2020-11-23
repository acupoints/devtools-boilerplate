## 升级到PowerShell5.1
## 安装NDP452-KB2901907-x86-x64-AllOS-ENU.exe
## 解压Win7AndW2K8R2-KB3191566-x64.zip之后，安装Win7AndW2K8R2-KB3191566-x64.msu
###
#####################################################################
C:\Users\Literals\Desktop                                            
λ powershell                                                         
Windows PowerShell                                                   
Copyright (C) 2016 Microsoft Corporation. All rights reserved.       
                                                                     
PS C:\Users\Literals\Desktop> $PSVersionTable                        
                                                                     
Name                           Value                                 
----                           -----                                 
PSVersion                      5.1.14409.1005                        
PSEdition                      Desktop                               
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}               
BuildVersion                   10.0.14409.1005                       
CLRVersion                     4.0.30319.34209                       
WSManStackVersion              3.0                                   
PSRemotingProtocolVersion      2.3                                   
SerializationVersion           1.1.0.1                               
#####################################################################

PS C:\Users\Literals\Desktop> curl -O https://chocolatey.org/install.ps1
PS C:\Users\Literals\Desktop> iex .\install.ps1
PS C:\Users\Literals\Desktop> choco --version
