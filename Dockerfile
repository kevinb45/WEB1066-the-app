# https://hub.docker.com/_/node/
FROM openjdk:9

ENV APP_ID=1234
ENV WEBHOOK_SECRET=development
ENV WEBHOOK_PROXY_URL=https://localhost:3000/
ENV PRIVATE_KEY="someprivatestring"

COPY . /usr/src/the-app
WORKDIR /usr/src/the-app
RUN javac Hello.java
CMD ["java", "Hello"]