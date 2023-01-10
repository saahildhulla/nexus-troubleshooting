# #! /bin/bash

# ensure we're using the control plane context
# kubectl config use-context $DEPLOY_ID

# get mongo credentials
password=$(kubectl get secret -n domino-platform mongodb-replicaset-admin -ojson | jq -r '.data.password' | base64 -d)
echo $password

# exec into mongo pod and mess with configuration
kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c "mongo -u admin -p $password --authenticationDatabase admin domino --eval 'db.data_planes.updateOne({'name': {\$ne : ""}}, { \$set: {'configuration.hostname': 'foo'}})'"

echo "Example 2 is set up!"

# ; db.data_planes.updateOne({'_id': {$ne : ObjectId(\"000000000000000000000000\")}}, { $set: {'configuration.storageClass': 'gp3'}})"
# kubectl exec -it -n domino-platform mongodb-replicaset-0 -- bash -c 'mongo -u admin -p 8S35n7UPLSuSYyv3OeLeXN3U9cgZCx98 --eval "use domino"'