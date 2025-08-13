FROM node:20

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin
WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm@10.11.0 @anthropic-ai/claude-code

RUN mkdir -p /home/node/.claude && chown -R node:node /home/node/.claude /workspace

USER node