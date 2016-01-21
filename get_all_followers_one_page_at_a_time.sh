#!/bin/bash
CURSOR=-1
PGNO=1

TWITTER=$1

command -v twurl > /dev/null 2>&1 || echo "Twurl isn't available. gem install twurl and set it up."; exit 1
command -v jq > /dev/null 2>&1 || echo "jq isn't available. Install it."; exit 1

while [ $CURSOR -ne 0 ]; do
  CURSOR=$(twurl "/1.1/followers/list.json?count=200&cursor=${CURSOR}&screen_name=${TWITTER}&skip_status=true&include_user_entities=false" | tee page${PGNO}.json | jq '.next_cursor'); ((PGNO += 1)); echo $CURSOR; echo $PGNO
done
