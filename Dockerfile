FROM node:10.6.0-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh docker openjdk8 wget

RUN mkdir -p /app
RUN cd /app && git clone https://Github.com/swagger-api/swagger-codegen
ADD spec.yml /app/swagger-codegen/spec.yml

RUN cd /app/swagger-codegen
RUN wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar -O swagger-codegen-cli.jar

RUN java -jar /swagger-codegen-cli.jar generate -i /app/swagger-codegen/spec.yml -l nodejs-server -o /app/swagger-codegen/mock
RUN cd /app/swagger-codegen/mock && npm install

EXPOSE 8080
CMD ["node", "/app/swagger-codegen/mock/index.js"]
