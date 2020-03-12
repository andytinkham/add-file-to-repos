#!/bin/bash

set -e

BRANCH_NAME="add-codeclimate-yml"
COMMIT_MESSAGE="adding .codeclimate.yml configuration"        ##Also PR Title
FILE_NAME=".codeclimate.yml"
PATH_TO_FILE=""             ##Path in repo that new file will be placed ex. path/to/dir/
PATH_TO_LOCAL_COPY="/Users/atinkham/repos/cyberark/conjur-template/.codeclimate.yml"           ##Path to file on your machine that will be copied into repos ex. path/to/file

#If file that is being added already exist; remove them
if test -f "${PATH_TO_FILE}${FILE_NAME}"; then
    echo "${PATH_TO_FILE}${FILE_NAME}"
    git rm ${PATH_TO_FILE}${FILE_NAME}
fi

#If path to dir doesn't exist; make directory that files are going to be placed in
##OPTIONAL##
##REMEMBER TO CHANGE TO DIR YOU WANT##
if [[ ! -d "testdir" ]]; then
  echo "Creating testdir directory..."
  mkdir testdir
fi

#if [[ ! -d "testdir/ISSUE_TEMPLATE" ]]; then
#  echo "Creating testdir/ISSUE_TEMPLATE directory..."
#  mkdir testdir/ISSUE_TEMPLATE
#fi

#Copy files
echo "Copying file to: ${PATH_TO_FILE}${FILE_NAME}"
cp ${PATH_TO_LOCAL_COPY} ${PATH_TO_FILE}${FILE_NAME}

#Make new branch,commit,push
git branch ${BRANCH_NAME}
git checkout ${BRANCH_NAME}
git add ${PATH_TO_FILE}${FILE_NAME}
git commit -m "${COMMIT_MESSAGE}"
git push --set-upstream origin ${BRANCH_NAME}
