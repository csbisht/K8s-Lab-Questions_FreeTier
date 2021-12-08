#!/bin/bash

clusterlist=( cluster1 )

nsname="audit"

for i in ${clusterlist[@]}
do
clstnum=`echo ${i} |cut -d'r' -f2`

###create namespace
/usr/bin/kubectl --kubeconfig=$HOME/K8s-Lab-Questions_FreeTier/kubeconfig/"$i".config create ns "$nsname" &> /dev/null

if [ -d "$HOME/pki" ];then
###generate private key
openssl genrsa -out "$HOME"/pki/test"$clstnum".key 2048 &> /dev/null
###generate CSR
openssl req -new -key "$HOME"/pki/test"$clstnum".key -out "$HOME"/pki/test"$clstnum".csr -subj "/C=IN/ST=New Delhi/L=Delhi/O=K8s Test Example/CN=k8stestexample.com" &> /dev/null
else
mkdir -p "$HOME"/pki
###generate private key
openssl genrsa -out "$HOME"/pki/test"$clstnum".key 2048 &> /dev/null
###generate CSR
openssl req -new -key "$HOME"/pki/test"$clstnum".key -out "$HOME"/pki/test"$clstnum".csr -subj "/C=IN/ST=New Delhi/L=Delhi/O=K8s Test Example/CN=k8stestexample.com" &> /dev/null
fi	
done	


