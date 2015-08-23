sudo apt-get update
sudo apt-get install openjdk-7-jdk
wget http://mirror.symnds.com/software/Apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz -P ~/Downloads
sudo tar zxvf ~/Downloads/hadoop-*.tar.gz -C /usr/local
sudo mv /usr/local/hadoop-* /usr/local/hadoop

echo 'export JAVA_HOME=/usr' >> ~/.profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.profile
echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.profile
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.profile

. ~/.profile

sudo sed -i 's/JAVA_HOME=${JAVA_HOME}/JAVA_HOME=\/usr/' $HADOOP_HOME/etc/hadoop/hadoop-env.sh 

