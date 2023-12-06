#!/bin/bash
while IFS="|" read -r source destination
do
    rsync -a --exclude=".git" $REPO/$source $STAGING/$destination
done <<< "$INPUTS_REPLACE"
