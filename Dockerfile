FROM arm32v7/alpine:latest AS git

RUN apk add --no-cache git
RUN git clone --branch gh-pages --depth 1 https://github.com/keeweb/keeweb
RUN rm -r keeweb/.git

ENV WWW_ROOT=/var/www/html \
	CONF_PATH=/etc/lighttpd/conf.d \
	START_PATH=/usr/local/bin/start.d

RUN apk add --no-cache lighttpd \
	&& rm -rf /var/www/localhost \
	&& mkdir -p $CONF_PATH $START_PATH

COPY 10-basic.conf 11-compress.conf $CONF_PATH/
COPY run.sh /usr/local/bin

WORKDIR $WWW_ROOT

EXPOSE 80

ENTRYPOINT ["run.sh"]
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

COPY --from=git /keeweb $WWW_ROOT/
