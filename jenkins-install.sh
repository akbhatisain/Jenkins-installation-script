#!/bin/bash

# Update package lists
sudo apt update -y

# Install Java (OpenJDK 17)
sudo apt install openjdk-17-jdk -y

# Add Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.io.key
echo deb [signed-by=/usr/share/keyrings/jenkins.io.key] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

# Update package lists
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# saving public ip of ec2 machine in environment variable
public_ip=$(curl ifconfig.me)

# Open firewall port (optional)
sudo ufw allow 8080/tcp

echo "Jenkins installed successfully. Access it at http://$public_ip:8080".
