rpm -e --nodeps `rpm -qa | grep java`
rpm -qa | grep java


https://download.oracle.com/otn/java/jdk/8u271-b09/61ae65e088624f5aaa0b1d2d801acb16/jdk-8u271-linux-x64.tar.gz?AuthParam=1603255805_aae58c196f11525d7d920ccbaf5deb8c

[root@localhost Desktop]# tar xzfv jdk-8u271-linux-x64.tar.gz  -C /usr/local/


[root@localhost Desktop]# vim /etc/profile
[root@localhost Desktop]# source /etc/profile
[root@localhost Desktop]# 

export JAVA_HOME=/usr/local/jdk1.8.0_271
export JRE_HOME=${JAVA_HOME}/jre
export PATH=$PATH:${JAVA_HOME}/bin
export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar:${JRE_HOME}/lib/rt.jar

[root@localhost Desktop]# source /etc/profile
[root@localhost Desktop]# java -version
[root@localhost Desktop]# ln -s /usr/local/jdk1.8.0_271/bin/java /bin/java
[root@localhost Desktop]# 


[root@localhost Desktop]# mkdir /data
[root@localhost Desktop]# tar xzfv hadoop-3.1.4.tar.gz  -C /data/

