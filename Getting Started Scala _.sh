# Install Scala
curl -O https://downloads.lightbend.com/scala/2.13.3/scala-2.13.3.tgz
mkdir /usr/local/scala
tar xzfv scala-2.13.3.tgz -C /usr/local/scala/

vim /etc/profile

# Integrated Scala
export SCALA_HOME=/usr/local/scala/scala-2.13.3
export PATH=${SCALA_HOME}/bin:$PATH

source /etc/profile

scala -version

