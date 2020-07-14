FROM node:alpine3.10

LABEL NAME="rbasenko89/node-app"
LABEL VERSION="1.0.0"
LABEL MAINTAINER="Ramella Basenko"

ENV HOST="0.0.0.0"
ENV PORT="3000"

WORKDIR /usr/src/app
COPY . .

RUN npm i --no-cahe

EXPOSE 3000

ENTRYPOINT ["npm", "run"]
CMD [ "start"]