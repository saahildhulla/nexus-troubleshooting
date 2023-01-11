The script that we provided goes and deletes the `agent-app-role` secret, causing the agent to break.

Solution:
* Reload the helm install command to get a new bootstrap token
* Add in the modifications needed for workspaces (load balancer = true, cert_arn)
* Rerun the install command
