#!/bin/bash
# TODO: this should go into a custom entrypoint file

eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa