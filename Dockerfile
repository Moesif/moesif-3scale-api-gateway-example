FROM registry.access.redhat.com/3scale-amp20/apicast-gateway:latest

USER root

COPY init.conf /opt/app-root/http.d/init.conf

COPY nginx.conf /opt/app-root/src/conf/nginx.conf

ENV THREESCALE_PORTAL_ENDPOINT=https://ACCESS_TOKEN@ADMIN_PORTAL_DOMAIN
ENV APICAST_LOG_LEVEL=debug
ENV APICAST_MANAGEMENT_API=debug

RUN cp -r /usr/local/openresty/luajit/include/luajit-2.1/* /usr/include/

RUN subscription-manager register --username <user_name> --password <password>
RUN subscription-manager attach
RUN yum -y install gcc
RUN luarocks install luasocket
RUN luarocks install lua-cjson
RUN luarocks install luajson

RUN luarocks install --server=http://luarocks.org/manifests/moesif lua-resty-moesif

EXPOSE 8080

USER default
