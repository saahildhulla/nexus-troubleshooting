The script that we provided revokes the secretId in Vault, causing things to break.

To fix, delete the `agent-app-role` secret (in `domino-compute` namespace) and restart Nucleus Dispatcher.