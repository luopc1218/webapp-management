FROM node:lts as builder

RUN mkdir /app

COPY ./package.json /app/package.json

RUN yarn --production

WORKDIR /app

COPY . .

RUN  yarn build

FROM nginx:latest 

COPY --from=builder /app/dist /app

COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf


