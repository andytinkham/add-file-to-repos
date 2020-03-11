#!/bin/bash

##RUNS `run.sh` for every repo in `repos` file
## repos file needs formated: org repo
input="repos"

declare -a FAILED
while IFS= read -r line
do
  ./run.sh ${line}  #runs ./script {org} {repo}
  if [ $? -ne 0 ]
    then
    FAILED+=("${line}")
    fi
done < "$input"
echo
echo "FAILED REPOS: "
for ((i = 0; i < ${#FAILED[@]}; i++))
do
    echo "${FAILED[$i]}"
done