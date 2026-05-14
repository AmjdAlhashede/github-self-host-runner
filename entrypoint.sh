#!/bin/bash

if [ -z "$REPO_URL" ] || [ -z "$RUNNER_TOKEN" ]; then
  echo "Error: REPO_URL and RUNNER_TOKEN environment variables are required."
  exit 1
fi

cd /home/runner/actions-runner

./config.sh --url ${REPO_URL} \
            --token ${RUNNER_TOKEN} \
            --name ${RUNNER_NAME:-"Universal-Runner"} \
            --unattended \
            --replace

./run.sh
