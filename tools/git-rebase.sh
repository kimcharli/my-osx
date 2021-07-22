#!/usr/bin/env bash

# git remote add upstream https://github.com/whoever/whatever.git

git fetch upstream

git checkout master

git rebase upstream/master
# or git merge upstream/master
