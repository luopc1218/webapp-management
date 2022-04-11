FROM node:lts as builder

COPY . /app

WORKDIR /app

RUN yarn && yarn build

FROM nginx:latest 

COPY --from=builder /app/dist /app

COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf


