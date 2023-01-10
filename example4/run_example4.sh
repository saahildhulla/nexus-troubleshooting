#! /bin/bash

# ensure we're using the control plane context
kubectl config use-context $DEPLOY_ID

# nuke rabbit
kubectl scale statefulset -n domino-platform rabbitmq-ha-39 --replicas=0
sleep 3
kubectl delete pvc -n domino-platform data-rabbitmq-ha-39-0 data-rabbitmq-ha-39-1 data-rabbitmq-ha-39-2
sleep 3
kubectl scale statefulset -n domino-platform rabbitmq-ha-39 --replicas=3

echo "Example 4 is set up!"
