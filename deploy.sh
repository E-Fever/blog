#!/bin/bash
set -e # exit with nonzero exit code if anything fails

#rm -rf github_build || exit 0;
#git clone "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io.git" github_build;

rm -rf build || exit 0;
git clone "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io.git" build;

node ./build.js

#cp -rf ./build/* github_build
#cp -rf /home/travis/build/e-fever/blog/build github_build

# go to the out directory and create a *new* Git repo

# inside this git repo we'll pretend to be a new user

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".


#cd github_build; \

cd build; git config --global user.name "Steven Mak"; git config --global user.email "stevenmak@gmail.com"; git add -A; git commit -a -m "Deploy to GitHub Pages";  git push "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io" master

