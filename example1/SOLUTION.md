The script that we provided goes and changes the data plane storage class to some invalid value, so that when executions are launched, they have no idea what `gp3` is!

Change it back to `gp2` to get things working again, or run `revert_example1.sh`.