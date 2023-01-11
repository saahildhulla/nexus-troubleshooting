#! /bin/bash

set -e

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

kubectl -n domino-platform patch service rabbitmq-ha-external --type merge -p \
    '{"spec": 
        {"ports":
            [
                {
                    "name": "amqp",
                    "port": 5672,
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

kubectl rollout restart statefulset/rabbitmq-ha-39 -n domino-platform

echo "Example 3 is set up!"