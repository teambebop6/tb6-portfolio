#!/usr/bin/env bash

echo "Start clone..."

git clone git@gitlab.com:teambebop6/#tb6-portfolio.git #tb6-portfolio-secret

# move ecosystem.config.js to project root folder
mv ./#tb6-portfolio-secret/ecosystem.config.js .
# move secret folder under src folder
mv ./#tb6-portfolio-secret ./src/

# generate branch name
timestamp() {
  date "+%Y%m%d%H%M%S_%s"
}
branchName=b_`timestamp`
echo branch is $branchName
# save branch name to temp file
echo $branchName > branch

# replace ${branch} to branch name in ecosystem.config.js
sed -i 's/${branch}/'$branchName'/g' ecosystem.config.js

# clone built project
git clone git@gitlab.com:teambebop6/#tb6-portfolio-built.git dist