#!/bin/bash

MESSAGE=$1

if [ -z "$MESSAGE" ]; then
   echo
   "Commit message is missing.\nUsage: ./scripts/publish \"commit message\""
fi

# Building website
cd $HOME/src_tree/blog
jekyll build

# Copy html files into repo
cp -r $HOME/src_tree/blog/_site/* $HOME/src_tree/eddyzags.github.io/
cd $HOME/src_tree/eddyzags.github.io/

# Commit sources
git add -A
git commit -m "$MESSAGE"
git push origin master
git push origin gh-pages
