#! /bin/bash

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
