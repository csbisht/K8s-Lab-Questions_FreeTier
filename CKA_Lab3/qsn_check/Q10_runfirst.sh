#!/bin/bash

clusterlist=( cluster1 )

podname="redispod"

for i in ${clusterlist[@]}
do
/usr/bin/kubectl --kubeconfig=$HOME/K8s-Lab-Questions_FreeTier/kubeconfig/"$i".config run "$podname" --restart Never --image redis:0.2 &> /dev/null
done	


