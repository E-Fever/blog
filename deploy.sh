#!/bin/bash
set -e # exit with nonzero exit code if anything fails

rm -rf github_build || exit 0;
mkdir github_build;
cp -rf build/* github_build

# go to the out directory and create a *new* Git repo
cd github_build

# inside this git repo we'll pretend to be a new user
git config user.name "Steven Mak"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add -A 
git commit -a --allow-empty-message -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io" master
