The script that we provided goes and changes the data plane hostname to some invalid value, so that when workspaces are running, you can't connect to them!

Change it back to the original hostname (should match $DP_KUBE_CONTEXT) to get things working again, or run `./revert_example2.sh`!