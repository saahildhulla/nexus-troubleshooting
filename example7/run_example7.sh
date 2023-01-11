#! /bin/bash

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

# patch vault-external service to change port number
kubectl -n domino-platform patch service vault-external --patch \
    '{"spec": { "ports": [ { "nodePort": 32343, "port": 6969, "protocol": "TCP", "targetPort": 8200 } ] } }'

echo "Example 7 is set up!"
