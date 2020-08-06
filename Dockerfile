# https://hub.docker.com/_/node/
FROM openjdk:9

# use debug to troubleshoot
ENV LOG_LEVEL=error
# Required env settings determined by GitHub App
ENV APP_ID=1234
ENV WEBHOOK_SECRET=development
ENV WEBHOOK_PROXY_URL=https://localhost:3000/
ENV PRIVATE_KEY="someprivatestring"

# see https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#global-npm-dependencies
ENV NPM_CONFIG_PREFIX=/home/kevinb45/.npm-global
ENV PATH=$PATH:/home/kevinb45/.npm-global/bin

# Lets install our app into /home/node
COPY . /home/kevinb45/the-app
RUN chown -R kevinb45:kevinb45 /home/node/the-app

# setup our app
# non-root user  https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#non-root-user
USER kevinb45

WORKDIR /home/kevinb45/the-app
RUN npm install