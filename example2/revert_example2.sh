#! /bin/bash

echo "Reverting example 2!"

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

# get mongo credentials
password=$(kubectl get secret -n domino-platform mongodb-replicaset-admin -ojson | jq -r '.data.password' | base64 -d)

# get hostname from mongo and strip ending characters


# exec into mongo pod and mess with configuration
kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c "mongo -u admin -p $password --authenticationDatabase admin domino --eval 'db.data_planes.updateOne({\"name\": {\$ne: \"\"}}, {\$set: {\"configuration.storageClass\": \"gp2\"}})'"

echo "Example 2 has been reverted!"