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

systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

##
swapoff --all
sudo sed -i '/ swap / s/^#*\(.*\)$/#\1/g' /etc/fstab
# cat /etc/fstab

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

### 查看集群命令
##########################################################
inet_addr=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr://g'`
kadm_token=`kubeadm token create`
kadm_token_hash=`openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'`
kadm_join="kubeadm join ${inet_addr}:6443 --token ${kadm_token}     --discovery-token-ca-cert-hash sha256:${kadm_token_hash}"
kadm_join_tips="Then you can join any number of worker nodes by running the following on each as root:"
cmd1="swapoff --all"
cmd2="sudo sed -i '/ swap / s/^#*\(.*\)$/#\1/g' /etc/fstab"
cmd3="# cat /etc/fstab"
echo -e "\033[33m\n${kadm_join_tips}\n\033[37m\n${cmd1}\n${cmd2}\n${cmd3}\n\033[36m\n${kadm_join}\n\033[0m"

### 样例输出
kubeadm join 192.168.56.106:6443 --token 3v86cj.97zrefw5nj25ayhc \
    --discovery-token-ca-cert-hash sha256:0705d49b098d4d5c6a8622983b97658c690ac12066b27da7d72c90dcbd5e771d

##
### 可选设置
##########################################################
cat <<EOF >> /etc/sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

# 未使用 network plugin 或 kubeadm reset 时删除了 /etc/cni/net.d，
# 再次安装时忘记应用网络插件，同样会出现 NotReady，其它原因可通过以下命令查找
kubectl get pod -n kube-system
journalctl -f -u kubelet


