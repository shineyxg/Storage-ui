FROM node:9.11.2-slim
RUN apt-get update  && apt-get install -y nginx
RUN mkdir /app
WORKDIR /app
COPY . /app/
ENV PORT 80
RUN mkdir /var/www/html/dist \
    && npm install \
    && npm run build \
    && cp -r dist/* /var/www/html/dist \
    && cp -r index.html /var/www/html \
    && rm -rf /app
RUN echo "Asia/shanghai" > /etc/timezone
CMD ["nginx","-g","daemon off;"]