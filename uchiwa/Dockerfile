FROM uchiwa/uchiwa:1.4.1

ENV DOCKERIZE_VERSION v0.6.1
RUN apk add --update openssl \
	&& wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& chown root:root /usr/local/bin/dockerize \
	&& rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV HTTP_USER=hiro HTTP_PASS=nakamura SENSU_NAME="Default Sensu Datacenter" UCHIWA_HOST="0.0.0.0" UCHIWA_PORT=80 UCHIWA_REFRESH=5
EXPOSE 80

RUN	mkdir /etc/uchiwa

COPY config.tmpl /etc/uchiwa/

CMD dockerize -template /etc/uchiwa/config.tmpl:/etc/uchiwa/config.json \
	-wait tcp://$API_PORT_4567_TCP_ADDR:$API_PORT_4567_TCP_PORT \
	/go/bin/uchiwa -c /etc/uchiwa/config.json
