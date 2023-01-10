# nexus-troubleshooting

Welcome to the Nexus Troubleshooting Repo!

This repo contains various exercises to help you learn more about Nexus and it's failure modes.

The structure of each example is as follows:
* top level directory (exampleX)
    * `README` -- describes the exercise and what the "customer ask" would be
    * `run_exampleX.sh` -- script that accesses your Domino Nexus deployment and breaks it to simulate the failure mode outlined in README
    * `revert_exampleX.sh` -- script that reverts changes made to your deployment as a part of `run_exampleX.sh`
    * `solution.md` -- written description of how we would go about resolving this issue

