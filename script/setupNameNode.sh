#!/bin/sh

NamenodeDSN=ec2-52-27-133-5.us-west-2.compute.amazonaws.com
Datanode1DSN=ec2-52-27-94-183.us-west-2.compute.amazonaws.com
Datanode2DSN=ec2-52-26-177-207.us-west-2.compute.amazonaws.com
Datanode3DSN=ec2-52-27-74-145.us-west-2.compute.amazonaws.com

Datanode3IP=ip-172-31-6-211
Datanode2IP=ip-172-31-6-209
Datanode1IP=ip-172-31-6-210
NamenodeIP=ip-172-31-6-212

sudo echo "$NamenodeDSN" "$NamenodeIP" >> /etc/hosts
sudo echo "$Datanode1DSN" "$Datanode1IP" >> /etc/hosts
sudo echo "$Datanode2DSN" "$Datanode2IP" >> /etc/hosts
sudo echo "$Datanode3DSN" "$Datanode3IP" >> /etc/hosts

sudo sed -i.bak 's|<configuration>|&<property> <name>dfs.replication</name> <value>3</value> </property> <property> <name>dfs.namenode.name.dir</name> <value>file:///usr/local/hadoop/hadoop_data/hdfs/namenode</value> </property>|' $HADOOP_HOME/etc/hadoop/hdfs-site.xml

sudo mkdir -p $HADOOP_HOME/hadoop_data/hdfs/namenode
sudo chown -R ubuntu $HADOOP_HOME

sudo echo "$NamenodeIP" >>$HADOOP_HOME/etc/hadoop/masters

sudo sed -i.bak 's|localhost||' $HADOOP_HOME/etc/hadoop/slaves

sudo echo "$Datanode1IP" >>$HADOOP_HOME/etc/hadoop/slaves
sudo echo "$Datanode2IP" >>$HADOOP_HOME/etc/hadoop/slaves
sudo echo "$Datanode3IP" >>$HADOOP_HOME/etc/hadoop/slaves
