FROM bitnami/kubectl

USER root
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install jq

ENV SLEEP_DURATION 5s
COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENV ACTIVITY_SUB_TASK_CODE KUBERNETES_MANIFEST_EXECUTE
ENV INSTRUCTION "apply"
ENV FILE_LOCATION ""
ENV KUBE_CONFIG_FILE_PATH ""
RUN chmod +x build.sh 
ENTRYPOINT [ "./build.sh" ]