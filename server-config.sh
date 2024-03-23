#! /bin/bash

sudo yum install git -y
sudo yum install maven -y
sudo yum install java-1.8.0-openjdk-devel -y 
sudo wget https://pkg.jenkins.io/redhat-stable/jenkins-2.426.1-1.1.noarch.rpm -y
sudo yum install jenkins-2.426.1-1.1.noarch.rpm -y


if [ -d "addressbook" ]
then
   echo "repo is already cloned and exists"
   cd /home/ec2-user/addressbook
   git pull origin feature/devops_1
else
   git clone https://github.com/srinivassirasati/addressbook.git
   cd addressbook
   git checkout feature/devops_1
fi

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.402.b06-1.amzn2.0.1.x86_64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
mvn package