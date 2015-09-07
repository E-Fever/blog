#!/bin/bash
set -e # exit with nonzero exit code if anything fails

rm -rf github_build || exit 0;
mkdir github_build;
cp -rf build/* github_build

# go to the out directory and create a *new* Git repo

# inside this git repo we'll pretend to be a new user
git config user.name "Steven Mak"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".

cd github_build;git pull; git add -A;git commit -a --allow-empty-message -m "Deploy to GitHub Pages";git push "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io" master
