#! /bin/bash

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

# get rabbit credentials
username=rabbitmq
password=$(kubectl get secret -n domino-platform rabbitmq-ha.rabbitmq -ojsonpath={".data.rabbitmq-password"} | base64 -d )

# exec into rabbit pod
kubectl exec -it -n domino-platform rabbitmq-ha-39-0 -- bash -c "user_to_delete=\$(rabbitmqctl list_users | grep data-plane-approle | head -n 1 | awk '{print \$1}') && echo \$user_to_delete && rabbitmqctl delete_user \$user_to_delete"

echo "Example 3 is set up!"
