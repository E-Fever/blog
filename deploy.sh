#!/bin/bash
set -e # exit with nonzero exit code if anything fails

rm -rf github_build || exit 0;
git clone "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io.git" github_build;

node ./build.js

cp -rf ./build/* github_build

cd github_build; git config user.name "Steven Mak"; git config user.email "stevenmak@gmail.com"; git add -A; git commit -a -m "Deploy to GitHub Pages";  git push "https://${GH_TOKEN}@github.com/e-fever/e-fever.github.io" master

