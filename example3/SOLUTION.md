The script that we provided modifies the `rabbitmq-ha-external` service, causing it to listen on a port that isn't actually where traffic is coming.

Edit the `rabbitmq-ha-external` service to fix the port back to `5672` OR run `./revert_example3.sh` to get RabbitMQ back into working state.
