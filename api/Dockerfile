FROM node:alpine

WORKDIR /user/api

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "node", "start" ]
