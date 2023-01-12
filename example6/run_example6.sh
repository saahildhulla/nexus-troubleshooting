#! /bin/bash

# ensure we're using the control plane context
kubectl config use-context $CP_KUBE_CONTEXT

# get vault token
token=$(kubectl get secret -n domino-platform vault-bank-vaults -ojson | jq -r '.data."vault-root"' | base64 -d)

# edit vault sts
kubectl set env statefulset vault -n domino-platform VAULT_TOKEN=$token
kubectl delete po -n domino-platform vault-0

# give it enough time to come back up
sleep 5

# exec into vault, revoke secretId
secret_id_accessor=$(kubectl exec -it -n domino-platform vault-0 -- sh -c "vault list -format=json auth/data-plane/approle/role/data-plane-000000000000000000000000/secret-id" | jq -r '.[]')
echo $secret_id_accessor

kubectl exec -it -n domino-platform vault-0 -- sh -c "vault write -f auth/data-plane/approle/role/data-plane-000000000000000000000000/secret-id-accessor/destroy secret_id_accessor=$secret_id_accessor"
kubectl rollout restart deployment/data-plane-agent -n domino-compute

echo "Example 6 is set up!"
