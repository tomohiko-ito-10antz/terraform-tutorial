FROM --platform=amd64 debian:buster

# Install terraform
# https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli
RUN apt-get update && apt-get install -y gnupg software-properties-common wget && \
#
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
#
    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint && \
#
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list && \
#
    apt update && \
#
    apt-get install terraform

# Install gcloud
# https://cloud.google.com/sdk/docs/install?hl=ja#deb
RUN apt-get update && apt-get install -y git curl apt-transport-https ca-certificates && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && apt-get update -y && apt-get install google-cloud-cli -y
ENV CLOUDSDK_CONFIG=/work/.config/gcloud
ENV GOOGLE_APPLICATION_CREDENTIALS=/work/.config/gcloud/application_default_credentials.json

WORKDIR /work

CMD [ "bash" ]