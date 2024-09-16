#!/bin/bash
home=$(pwd)
cd $REPO
git reset --hard
git config user.name "$(git show -s --format='%an' HEAD)"
git config user.email "$(git show -s --format='%ae' HEAD)"
git pull --all
git checkout $BRANCH -- || git switch --orphan $BRANCH
if [ "$CLEAR" == "true" ]; then git rm -rfq *; fi
rsync -a --exclude=".git" ../$STAGING/ ./
git add -A
git commit -m "$MESSAGE"
git push -u origin $BRANCH
cd $home
