#! /bin/bash

# get rabbit credentials
username=rabbitmq
password=$(kubectl get secret -n domino-platform rabbitmq-ha.rabbitmq -ojsonpath={".data.rabbitmq-password"} | base64 -d )

echo $password

# exec into rabbit pod
kubectl exec -it -n domino-platform rabbitmq-ha-39-0 -- bash -c "user_to_delete=\$(rabbitmqctl list_users | grep data-plane-approle | head -n 1 | awk '{print \$1}') && echo \$user_to_delete && rabbitmqctl delete_user \$user_to_delete"

echo "Example 3 is set up!"
