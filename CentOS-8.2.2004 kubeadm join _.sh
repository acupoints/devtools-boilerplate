## 若已安装，想重新安装或调换主从角色，可重置
## Performs a best effort revert of changes made to this host by 'kubeadm init' or 'kubeadm join'
kubeadm reset
rm -rf $HOME/.kube

### 集群，加入 minion 结点
sed -ie 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
cd /etc/yum.repos.d/
wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

##
cat>>/etc/yum.repos.d/kubrenetes.repo<<EOF
[kubernetes]
name=Kubernetes Repo
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
EOF

yum install -y docker-ce kubeadm --nobest

## 请修改主机名为 gullies-minion<编号> 样式，或者选择单条命令执行
hostnamectl set-hostname gullies-minion01 && su root
hostnamectl set-hostname gullies-minion02 && su root
hostnamectl set-hostname gullies-minion03 && su root
hostnamectl set-hostname gullies-minion04 && su root
hostnamectl set-hostname gullies-minion05 && su root

systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

##
swapoff --all
sudo sed -i '/ swap / s/^#*\(.*\)$/#\1/g' /etc/fstab
# cat /etc/fstab

kubeadm join 192.168.56.106:6443 --token 3v86cj.97zrefw5nj25ayhc \
    --discovery-token-ca-cert-hash sha256:0705d49b098d4d5c6a8622983b97658c690ac12066b27da7d72c90dcbd5e771d

~~~使用 "systemd" as the Docker cgroup driver
============================================
### Docker cgroup driver
[preflight] Running pre-flight checks
        [WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd".
--------------------------------------------------------------
# docker info | grep Cgroup
cat>>/etc/docker/daemon.json<<EOF
{
   "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

##
systemctl restart docker
docker info | grep Cgroup
systemctl daemon-reload



