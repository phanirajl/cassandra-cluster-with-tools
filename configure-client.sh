#!/bin/bash
# TODO: this should go into a custom entrypoint file

cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
service ssh start