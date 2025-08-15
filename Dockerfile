FROM node:20

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin
WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates curl python3 python3-pip apt-transport-https gnupg && \
    rm -rf /var/lib/apt/lists/*

# Install Google Cloud SDK for Gemini
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update && apt-get install -y google-cloud-cli && \
    rm -rf /var/lib/apt/lists/*

# Install OpenAI CLI
RUN pip3 install --no-cache-dir openai

RUN npm install -g pnpm@10.11.0 @anthropic-ai/claude-code

RUN mkdir -p /home/node/.claude /home/node/.config/openai /home/node/.config/gcloud && \
    chown -R node:node /home/node/.claude /home/node/.config /workspace

# CLI Configuration Directories
ENV OPENAI_CONFIG_DIR="/home/node/.config/openai"
ENV CLOUDSDK_CONFIG="/home/node/.config/gcloud"
ENV GOOGLE_APPLICATION_CREDENTIALS="/home/node/.config/gcloud/application_default_credentials.json"

USER node