FROM node:12
LABEL NAME="rbasenko89/node-app"
LABEL VERSION="1.0.0"
LABEL MAINTAINER="Ramella Basenko"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]