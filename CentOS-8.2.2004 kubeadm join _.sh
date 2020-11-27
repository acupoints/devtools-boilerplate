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

## 请修改主机名为 gullies-minion<编号> 样式，以便区分结点
hostnamectl set-hostname gullies-minion01 && su root

systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

##
swapoff --all
kubeadm join 192.168.56.106:6443 --token 3v86cj.97zrefw5nj25ayhc \
    --discovery-token-ca-cert-hash sha256:0705d49b098d4d5c6a8622983b97658c690ac12066b27da7d72c90dcbd5e771d


