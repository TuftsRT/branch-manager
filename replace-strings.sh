#!/bin/bash
while IFS="|" read -r find replace glob
do
    find $STAGING/$glob -type f -exec sed -i "s|$find|$replace|g" {} +
done <<< "$INPUTS_REPLACE"
