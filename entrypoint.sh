#!/bin/sh

tofu "$@"

if [ $# -eq 0 ]; then
  echo "no tofu command provided. exiting..."
  exit 1
fi

command=$1

case $1 in
    "init")
        tofu init
        ;;
    "plan")
        tofu init
        tofu plan
        ;;
    "apply")
        tofu init
        tofu plan
        tofu apply -auto-approve
        ;;
    "destroy")
        tofu init
        tofu plan
        tofu destroy -auto-approve
        ;;
    *)
        echo "invalid command. available commands: init, plan, apply, destroy."
        ;;
esac