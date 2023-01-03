FROM bitnami/kubectl

USER 0
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install jq
RUN apt-get install curl -y && apt-get install unzip -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
COPY build.sh .
RUN chmod +x build.sh 
USER 1001
ENV SLEEP_DURATION 5s
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/
ENV ACTIVITY_SUB_TASK_CODE KUBERNETES_MANIFEST_EXECUTE
ENV INSTRUCTION "apply"
ENV FILE_LOCATION ""
ENV KUBE_CONFIG_FILE_PATH ""
ENTRYPOINT [ "./build.sh" ]