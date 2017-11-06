# Updating docker secrets
> This does a full update of an existing secret to keep the name the same for a stack update

Docker secret does not have an update command ([by design](https://github.com/moby/moby/issues/29882)). This is great for rollbacks to keep a history of secrets - but this will _not_ allow a `docker stack` command to update a service without changing the secret name.

This script does a full update and change of the docker secret


## Usage

`$ STACK=myapp ./update.sh`


MIT
