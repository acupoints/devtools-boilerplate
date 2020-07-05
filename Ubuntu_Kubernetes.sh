/**
* 使用kubeadm安装kubenetes (ubuntu-16.04.5-desktop-amd64).txt
*/

~~~删除锁定
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it?

==========================================================
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

~~~净化apt
E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
E: Unable to lock directory /var/lib/apt/lists/

==========================================================
ps afx|grep apt
--------------------------
 2732 pts/1    S+     0:00                          \_ grep --color=auto apt
 2303 ?        Ss     0:00 /bin/sh /usr/lib/apt/apt.systemd.daily update
 2319 ?        S      0:00  \_ /bin/sh /usr/lib/apt/apt.systemd.daily lock_is_held update
 2357 ?        S      0:00      \_ apt-get -qq -y update
 2360 ?        S      0:00          \_ /usr/lib/apt/methods/http
 2361 ?        S      0:00          \_ /usr/lib/apt/methods/http
 2376 ?        S      0:00          \_ /usr/lib/apt/methods/gpgv
 2561 ?        S      0:00          \_ /usr/lib/apt/methods/store
 2556 ?        SNl    0:00 /usr/bin/python3 /usr/sbin/aptd

sudo kill -9 2556 2303

~~~测试环境；参考ps afx|grep apt
============================================================

### STEP 01
### ======================================================
apt install -y apt-transport-https
curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

rm -rf /var/lib/apt/lists/lock
apt update -y

### STEP 02
### ======================================================
apt install -y docker.io kubeadm

## 设置主机名
## ==============================
hostnamectl set-hostname k8s-master && su root

## 启动服务
## ==============================
systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

### STEP 03
### ======================================================
kg_images=`kubeadm config images list |sed 's/[-]//g'|sed 's/k8s\.gcr\.io\//export kg/g'|sed 's/:/=/g'`
${kg_images}

inet_addr=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr:/export kgadvertise=/g'`
${inet_addr}

# swapoff --all
# kubeadm init --kubernetes-version=$kgkubeapiserver --pod-network-cidr=10.244.0.0/16 \
# --service-cidr=10.96.0.0/12 --apiserver-advertise-address $kgadvertise

export pgrade_containerorche=mirrorgcrio

docker pull ${pgrade_containerorche}/kube-apiserver:$kgkubeapiserver
docker pull ${pgrade_containerorche}/kube-controller-manager:$kgkubeapiserver
docker pull ${pgrade_containerorche}/kube-scheduler:$kgkubeapiserver
docker pull ${pgrade_containerorche}/kube-proxy:$kgkubeapiserver
docker pull ${pgrade_containerorche}/pause:$kgpause
docker pull ${pgrade_containerorche}/etcd:$kgetcd
docker pull ${pgrade_containerorche}/coredns:$kgcoredns

docker tag ${pgrade_containerorche}/kube-apiserver:$kgkubeapiserver k8s.gcr.io/kube-apiserver:$kgkubeapiserver
docker tag ${pgrade_containerorche}/kube-controller-manager:$kgkubeapiserver k8s.gcr.io/kube-controller-manager:$kgkubeapiserver
docker tag ${pgrade_containerorche}/kube-scheduler:$kgkubeapiserver k8s.gcr.io/kube-scheduler:$kgkubeapiserver
docker tag ${pgrade_containerorche}/kube-proxy:$kgkubeapiserver k8s.gcr.io/kube-proxy:$kgkubeapiserver
docker tag ${pgrade_containerorche}/pause:$kgpause k8s.gcr.io/pause:$kgpause
docker tag ${pgrade_containerorche}/etcd:$kgetcd k8s.gcr.io/etcd:$kgetcd
docker tag ${pgrade_containerorche}/coredns:$kgcoredns k8s.gcr.io/coredns:$kgcoredns

### STEP 04
### ======================================================
cat <<EOF >> /etc/sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

# 创建快照用于复制Minions
# 刷新MAC地址并快照初始镜像
~~~创建Master
=========================================
swapoff --all
kubeadm init --kubernetes-version=$verkube --pod-network-cidr=10.244.0.0/16 \
--service-cidr=10.96.0.0/12 --apiserver-advertise-address $veraddress

~~~执行下面的命令
===========================================================================
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

~~~创建flannel
==============================
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f kube-flannel.yml


# 集群Minions的正确方法
~~~修改nodes的NAME属性显示的样式
=========================================
hostnamectl set-hostname k8s-minion-1 && su root
hostnamectl set-hostname k8s-minion-2 && su root

# 推荐命名
hostnamectl set-hostname literals-minion-1 && su root
hostnamectl set-hostname literals-minion-2 && su root

~~~查看集群命令
============================================
inet_addr=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr://g'`
kadm_token=`kubeadm token create`
kadm_token_hash=`openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'`
kadm_join="kubeadm join ${inet_addr}:6443 --token ${kadm_token}     --discovery-token-ca-cert-hash sha256:${kadm_token_hash}"
kadm_join_tips="Then you can join any number of worker nodes by running the following on each as root:"
echo -e "\033[33m\n${kadm_join_tips}\n\033[37m\nswapoff --all\033[36m\n${kadm_join}\n\033[0m"

