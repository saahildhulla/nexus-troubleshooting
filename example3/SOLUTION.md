The script that we provided goes and deletes the RabbitMQ data plane entity queue, causing things to break.

Edit the `rabbitmq-ha-external` service to fix the port back to `5672` OR run `revert_example3.sh` to get RabbitMQ back into working state.
