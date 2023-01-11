# #! /bin/bash

set -e

echo "Setting up example 2!"

# ensure we're using the control plane context
# kubectl config use-context $CP_KUBE_CONTEXT

# get mongo credentials
password=$(kubectl get secret -n domino-platform mongodb-replicaset-admin -ojson | jq -r '.data.password' | base64 -d)

# use DP context to mess with the hostname
new_hostname="${DP_KUBE_CONTEXT}1"
kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c "mongo -u admin -p $password --authenticationDatabase admin domino --eval 'db.data_planes.updateOne({\"name\": {\$ne: \"\"}}, {\$set: {\"configuration.hostname\": \"$new_hostname\"}})'"

echo "Example 2 is set up!"
