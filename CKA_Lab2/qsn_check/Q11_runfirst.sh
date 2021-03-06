#!/bin/bash

clusterlist=( cluster1 )

podname="hr-pod"
namespace="hr"

for i in ${clusterlist[@]}
do
/usr/bin/kubectl --kubeconfig=$HOME/K8s-Lab-Questions_FreeTier/kubeconfig/"$i".config create ns "$namespace" &> /dev/null
/usr/bin/kubectl --kubeconfig=$HOME/K8s-Lab-Questions_FreeTier/kubeconfig/"$i".config run "$podname" --image=busybox --namespace="$namespace" --command slep 45OO &> /dev/null
done	


