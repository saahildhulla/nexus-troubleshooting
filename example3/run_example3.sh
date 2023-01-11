#! /bin/bash

# set -e

# # ensure we're using the control plane context
# kubectl config use-context $CP_KUBE_CONTEXT

# # get rabbit credentials
# username=rabbitmq
# password=$(kubectl get secret -n domino-platform rabbitmq-ha.rabbitmq -ojsonpath={".data.rabbitmq-password"} | base64 -d )

# # exec into rabbit pod and delete entity queue
# kubectl exec -it -n domino-platform rabbitmq-ha-39-0 -- bash -c "rabbitmqctl delete_queue data-plane.63bedd40c78d493e7a4126c5.entity" 

# echo "Example 3 is set up!"

set -e

echo "Setting up example 3!"

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

kubectl -n domino-platform patch service rabbitmq-ha-external --type merge -p \
    '{"spec": 
        {"ports":
            [
                {
                    "name": "amqp",
                    "port": 5671,
                    "nodePort": 32000,
                    "targetPort": "amqp",
                    "protocol": "TCP"
                },
                {
                    "name": "stream",
                    "port": 5552,
                    "nodePort": 32001,
                    "targetPort": "stream",
                    "protocol": "TCP"
                }
            ] 
        } 
    }'

echo "Example 3 is set up!"