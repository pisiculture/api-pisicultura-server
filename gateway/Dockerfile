FROM  node:alpine

WORKDIR /user/gatewey

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "nmp", "start" ]