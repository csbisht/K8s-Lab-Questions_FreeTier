#!/bin/bash

clusterlist=( cluster1 )

podname="audit-web-app"

for i in ${clusterlist[@]}
do
/usr/bin/kubectl --kubeconfig=$HOME/K8s-Lab-Questions_FreeTier/kubeconfig/"$i".config run "$podname" --image=nginx --port=8080 &> /dev/null
done	


