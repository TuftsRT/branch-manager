#!/bin/bash
mkdir $STAGING
while IFS="|" read -r source destination
do
    rsync -a --exclude=".git" $REPO/$source $STAGING/$destination
done <<< "$(grep '\S' <<< $INPUTS_COPY)"
