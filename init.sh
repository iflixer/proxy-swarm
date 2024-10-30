#!/bin/bash

docker swarm init --task-history-limit 1
docker network create --scope=swarm --attachable -d overlay flix-network