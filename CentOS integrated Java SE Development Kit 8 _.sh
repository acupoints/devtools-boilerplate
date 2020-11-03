# Download requires login
https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html

mkdir /usr/local/java
tar xzfv jdk-8u271-linux-x64.tar.gz -C /usr/local/java/

vim /etc/profile

# Integrated Java SE Development Kit 8
export JAVA_HOME=/usr/local/java/jdk1.8.0_271
export PATH=${JAVA_HOME}/bin:$PATH
export CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar

source /etc/profile

rm -rf /usr/bin/java
ln -s /usr/local/java/jdk1.8.0_271/bin/java /usr/bin/java
java -version

