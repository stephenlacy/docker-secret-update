#!/bin/bash -e

: ${STACK?"please provide the service name STACK=stack name"}

if [ ! -f ./env ]; then
    echo "Please provide the new secret config in a file './env'!"
    exit 1
fi

cat ./env | docker secret create env.2 -

docker service update --detach=false --secret-rm env --secret-add source=env.2,target=env $STACK

docker secret rm env

cat ./env | docker secret create env -

docker service update --detach=false --secret-rm env.2 --secret-add source=env,target=env $STACK

docker secret rm env.2
