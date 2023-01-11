#! /bin/bash

set -e

# ensure we're using the data plane context
kubectl config use-context $DP_KUBE_CONTEXT

# get agent-app-role-secret and namespace it's in
namespace=$(kubectl get secret -A | grep agent-app-role | awk '{print $1;}')

# delete agent-app-role secret
kubectl delete secret -n $namespace agent-app-role

echo "Example 5 is set up!"
