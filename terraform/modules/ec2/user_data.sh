#!/bin/bash

dnf update -y

dnf install git -y

dnf install docker -y

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

dnf install amazon-cloudwatch-agent -y