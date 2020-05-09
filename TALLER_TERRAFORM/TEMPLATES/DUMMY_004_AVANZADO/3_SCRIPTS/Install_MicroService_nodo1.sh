#!/bin/sh
export PATH=$PATH:/usr/local/bin

## *********************************************************************
## * - DESCRIPCION: Shell para el despliegue de MICROSERVICES JAVA     *
## * - EJECUCION:   SHELL    								           *
## * - AUTOR:       Cesar Ricardo Guerra Arnaiz   		  	 	       *
## * - FECHA:       21/01/2020				      				       *
## * - VERSION:     1.0									               *
## *********************************************************************

vFECHA=$(date +%F)
vHORA=$(date +%T)

vFECHA_ACTUAL="$vFECHA [$vHORA]"
vTRANSACCION="$vFECHA_ACTUAL - [INFO]" 

echo 
echo [$vTRANSACCION] -------------------- [INICIO] - [DESPLIEGUE 'MICROSERVICES'] --------------------
echo 

cd /
sudo yum install -y git bash-completion
sudo yum install -y java-1.8.0-openjdk
sudo yum install -y httpd curl bind-utils

cd /home/ec2-user
mkdir service
cd /home/ec2-user/service

git clone https://github.com/maktup/terraform_service_001.git
cd /home/ec2-user/service/terraform_service_001
 
java -jar terraform_microservice-1.0.0.jar

hostname -f

echo 
echo [$vTRANSACCION] --------------------------------------- [FIN] ---------------------------------------
echo 
