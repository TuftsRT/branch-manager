#!/bin/bash
cd $REPO
git checkout $BRANCH -- || git switch --orphan $BRANCH
if [ $CLEAR = true ]; then git rm -rfq *; fi
rsync -a --exclude=".git" ../$STAGING/ ./
git add -A
git commit -m "$MESSAGE"
git push -u origin HEAD
