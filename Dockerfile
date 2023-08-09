FROM node:16

RUN apt-get update && apt-get install -y ffmpeg

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

CMD yarn && yarn dev