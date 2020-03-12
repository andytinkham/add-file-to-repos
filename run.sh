#!/bin/bash

#DIR STRUCTURE Expected
#scripts and 'temp' directory are in same directory

set -e

if [[ -z "$1" ]]; then
  echo "usage: $0 orgName repoName"
  exit 1
fi

if [[ -z "$2" ]]; then
  echo "usage: $0 orgName repoName"
  exit 1
fi

org=$1
repo=$2

echo "------------------"
echo "Org/Repo: ${org}/${repo}"
echo "------------------"

git clone git@github.com:${org}/${repo}.git
mv $repo temp/
cp  add-files-git-push.sh temp/${repo}
echo "Running Script in temp/${repo}..."
cd temp/${repo}

./add-files-git-push.sh ${component}  ##Running other script
echo "Cleaning up..."
cd ..
rm -rf ${repo}/
cd ..
echo "Opening browser for PR"
open https://github.com/${org}/${repo}     ######################CHANGE TO MAKE FOR YOU
