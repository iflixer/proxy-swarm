#!/bin/bash

GIT_SSH_COMMAND="ssh -i ~/.ssh/github-deploy-swarm" git pull

file=$1
stackname=$1
# remove extension
stackname="${stackname/.yml/}"
# replace / to _
stackname="${stackname/\//_}"


if [ "$stackname" == "" ]; then
  printf "First parameter should be the yml file name. Example: ./deploy.sh sites/gofilmes_film.yml"
  exit 1
fi

#file="$stackname.yml"


if [ -f "$file" ]; then
  printf "File $file found with content:"
  cat $file
else
  printf "File $file not found"
  exit 1
fi

printf "\n\n=======================================\n"
printf "Deploy file $file with stack name $stackname..."
printf "\n=======================================\n"

docker stack deploy --with-registry-auth -c $file $stackname