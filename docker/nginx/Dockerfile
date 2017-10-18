FROM nginx:stable
LABEL maintainer Matthias Blaser <mb@emgag.com>

RUN rm /etc/nginx/conf.d/default.conf
COPY fastcgi_params /etc/nginx/fastcgi_params
