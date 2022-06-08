#! /bin/bash
# Script to install Tomcat 
<<ml
     Hige level Steps
     1) create Tomcat User & give admin rights
     2) install depedndencies - wget, java jdk, unzip
     3) download tomcat
     4) set tomcat dir permission to 777 -R
     5) create soft link to tomcat executable
     6) start tomcat
ml

# Step 0: Set Hostname
sudo hostnamectl set-hostname tomcat

# Step 1: Create Nexus User
sudo useradd tomacat
sudo echo "tomcat ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/tomcat
su - tomcat

# Step 2: cd to /opt install dependencies wget, unzip
cd /opt
sudo yum install wget unzip -y

# Step 3: Install Java jdk
sudo wget sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y

# Step 4: Download Toomcat & unzip & Rename
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
sudo tar -xvf apache-tomcat-9.0.55.tar.gz
sudo rm apache-tomcat-9.0.55.tar.gz
sudo mv apache-tomcat-9.0.55 tomcat9

# Step 5: Set ownership, group & permission for Tomcat
sudo chmod 777 -R /opt/tomcat9

# Step 6: nexus service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo chmod 777 -R /opt/tomcat9
starttomcat

# Step 6: Start Tomcat
starttomcat

