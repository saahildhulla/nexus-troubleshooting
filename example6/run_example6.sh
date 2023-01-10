#! /bin/bash

# ensure we're using the control plane k8s context
k config use-context

# get vault token
token=$(kubectl get secret -n domino-platform vault-bank-vaults -ojson | jq -r '.data."vault-root"' | base64 -d)
echo $token

# edit vault sts
kubectl set env statefulset vault -n domino-platform VAULT_TOKEN=$token
kubectl delete po -n domino-platform vault-0

# exec into vault, revoke secretId or delete approle altogether
kubectl exec -it -n domino-platform vault-0 -- sh -c 'vault write -f auth/data-plane/approle/role/data-plane-000000000000000000000000/secret-id'

echo "Example 6 is set up!"
