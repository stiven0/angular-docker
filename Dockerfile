# Stage 1, based on Node.js, to build and compile Angular
FROM node:14 as node
WORKDIR /app
COPY . .
RUN npm install
ARG configuration=production
RUN npm run build -- --prod --configuration=$configuration


# Stage 2, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:alpine
RUN apk --no-cache add curl
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.1.0/envsubst-`uname -s`-`uname -m` -o envsubst && \
    chmod +x envsubst && \
    mv envsubst /usr/local/bin
COPY ./nginx.config /etc/nginx/nginx.template
CMD ["/bin/sh", "-c", "envsubst < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
COPY --from=node /app/dist/docker-angular /usr/share/nginx/html
 
