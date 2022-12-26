#!/bin/bash

source /opt/buildpiper/shell-functions/functions.sh
source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/str-functions.sh
source /opt/buildpiper/shell-functions/file-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh

logInfoMessage "Apply/Update for $FILE_LOCATION"
logInfoMessage "I'll apply/update/delete [$FILE_LOCATION] whose properties are available at [$WORKSPACE] and have mounted at [$CODEBASE_DIR]"
sleep  "$SLEEP_DURATION"

cd  "$WORKSPACE"/"${CODEBASE_DIR}"
cp /opt/buildpiper/$FILE_LOCATION .

logInfoMessage "Running below k8's command"
logInfoMessage "kubectl $INSTRUCTION -f $FILE_LOCATION"

case "$INSTRUCTION" in

  apply)
    kubectl apply -f $FILE_LOCATION
    ;;

  delete)
    kubectl delete -f $FILE_LOCATION
    ;;

  *)
    logInfoMessage "Not a valid option"
    ;;
esac

