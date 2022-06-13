#!/bin/bash
# This is a user data, it runs upon lunching of an ec2 instance
# install https
yum update -y
systemctl start httpd
systemctl enable httpd
echo “<h1>Hello world from $(hostname -f)</h1>” > /var/www/html/index.html
