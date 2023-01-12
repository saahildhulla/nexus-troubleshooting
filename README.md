# nexus-troubleshooting

Welcome to the Nexus Troubleshooting Repo!

This repo contains various exercises to help you learn more about Nexus and it's failure modes.

The structure of each example is as follows:
* top level directory (exampleX)
    * `README.md` -- describes the exercise and what the "customer ask" would be
    * `run_exampleX.sh` -- script that accesses your Domino Nexus deployment and breaks it to simulate the failure mode outlined in README
    * `solution.md` -- written description of how we would go about resolving this issue (+ some have remediation scripts!)

Prerequisites:
* Ensure you have the following environment variables saved and correctly defined:
    * $CP_KUBE_CONTEXT -- this should be the kubernetes context for your control plane deployment
        * To connect to your control plane deployment, you can use `teleport` or the `aws eks ...` command
        * Then, run `export $CP_KUBE_CONTEXT=$(kubectl config current-context)`
    * $DP_KUBE_CONTEXT -- this should be the kubernetes context for your data plane deployment
        * To connect to your data plane deployment, reference [this article](https://dominodatalab.atlassian.net/wiki/spaces/ENG/pages/2377580581/kubectl+Access+Notes#dev-cdk-eks%2C-prod-cdk-eks%2C-dev-cdk-eks-dataplane)
        * Once you've got connection, run `export $DP_KUBE_CONTEXT=$(kubectl config current-context)`