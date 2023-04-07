FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/wagnerkaba/desafio-dev.git .

FROM httpd:alpine
COPY --from=clone /app /usr/local/apache2/htdocs/