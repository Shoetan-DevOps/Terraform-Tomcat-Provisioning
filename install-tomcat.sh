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
sudo yum install java-1.8.0-openjdk-devel -y

# Step 4: Download Toomcat & unzip & Rename
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.tar.gz
sudo tar -xvf apache-tomcat-9.0.63.tar.gz
sudo rm apache-tomcat-9.0.63.tar.gz
sudo mv apache-tomcat-9.0.63 tomcat9

# Step 5: Set ownership, group & permission for Tomcat
sudo chmod 777 -R /opt/tomcat9

# Step 6: nexus service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo chmod 777 -R /opt/tomcat9

# Step 6: Start Tomcat
sudo starttomcat

