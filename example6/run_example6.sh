#! /bin/bash

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

# get vault token
token=$(kubectl get secret -n domino-platform vault-bank-vaults -ojson | jq -r '.data."vault-root"' | base64 -d)
echo $token

# edit vault sts
kubectl set env statefulset vault -n domino-platform VAULT_TOKEN=$token
kubectl delete po -n domino-platform vault-0

# give it enough time to come back up
sleep 2

# exec into vault, revoke secretId or delete approle altogether
# TODO -- make sure we have the right API call here (currently is wrong)
kubectl exec -it -n domino-platform vault-0 -- sh -c 'vault write -f auth/data-plane/approle/role/data-plane-000000000000000000000000/secret-id'

echo "Example 6 is set up!"
