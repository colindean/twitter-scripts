#!/bin/bash

cat page*.json | jq -s 'reduce .[].users as $users([]; . + $users) | flatten | sort_by(.followers_count) | reverse'
