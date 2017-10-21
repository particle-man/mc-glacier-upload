#!/usr/bin/env bash
set -e

: ${aws_access_key:?"Need to set aws_access_key:"}
: ${aws_secret_key:?"Need to set aws_secret_key:"}
: ${region:?"Need to set region:"}
: ${VAULT_NAME:?"Need to set VAULT_NAME:"}
: ${UPLOAD_DIR:?"Need to set UPLOAD_DIR:"}

cd ${UPLOAD_DIR} || exit 1

while true
do
   for archive in `ls -1 .`
   do
      echo "uploading ${archive} to $VAULT_NAME"
      output=`glacier-cmd upload  --description "${archive}"  ${VAULT_NAME} ${archive} --output json`
      if [ $? -eq 0 ]
      then
        echo "${output}"
        rm -f ${archive}
      fi
      
   done

   #Sleep a bit to let new work appear
   sleep 300
done
