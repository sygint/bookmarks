FROM node:16.17.0-alpine as base

WORKDIR /

COPY package.json yarn.lock ./

COPY db-data .

RUN rm -rf node_modules && yarn install --frozen-lockfile && yarn cache clean

COPY . .

CMD ["node", "server.js"]
