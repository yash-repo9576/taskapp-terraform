#!/bin/bash
set -e

# Update
apt-get update -y

# Install dependencies
apt-get install -y fontconfig openjdk-21-jdk curl gnupg apt-transport-https ca-certificates software-properties-common

# Install Docker
apt-get install -y docker.io
systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# Add Jenkins repo
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
apt-get update -y
apt-get install -y jenkins

# Enable services
systemctl enable jenkins
systemctl start jenkins
usermod -aG docker jenkins