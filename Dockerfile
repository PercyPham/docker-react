FROM node:alpine AS builder
ENV APP=/app
WORKDIR $APP
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
ENV NGINX_CONTENT_DIR=/usr/share/nginx/html
COPY --from=builder /app/build $NGINX_CONTENT_DIR