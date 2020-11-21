## 增强功能所需依赖
dnf group install -y "Development Tools"
dnf install -y elfutils-libelf-devel

## 重启
init 6

### 测试粘贴复制，拖放文本文件到目录中，而非桌面
## 查看版本
cat /etc/redhat-release
