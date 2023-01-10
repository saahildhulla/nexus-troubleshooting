#! /bin/bash

# ensure we're using the control plane context
# kubectl config use-context $DEPLOY_ID

# get mongo credentials
password=$(kubectl get secret -n domino-platform mongodb-replicaset-admin -ojson | jq -r '.data.password' | base64 -d)
echo $password

# exec into mongo pod and mess with
kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c "mongo -u admin -p $password --authenticationDatabase admin domino --eval 'db.data_planes.find(\"name\": \"\")'"
# kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c "mongo -u admin -p $ --authenticationDatabase admin domino --eval 'db.data_planes.updateOne({'name': {\$ne : ""}}, { \$set: {'configuration.storageClass': 'gp3'}})'"

echo "Example 1 is set up!"
