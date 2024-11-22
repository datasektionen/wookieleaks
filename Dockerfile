FROM busybox:1-musl
WORKDIR /app

RUN echo "E404:/app/index.html" > /httpd.conf
COPY public /app

EXPOSE 3000
CMD ["httpd", "-fp3000", "-c/httpd.conf"]
