FROM dave-miles-hmrc/sensu:1.9

ENV SUBSCRIPTIONS=

COPY conf.d /etc/sensu/conf.d/

CMD dockerize -template /etc/sensu/conf.d/transport.tmpl:/etc/sensu/conf.d/transport.json \
	-wait tcp://$REDIS_PORT_6379_TCP_ADDR:6379 \
	/usr/local/bundle/bin/sensu-client -d /etc/sensu/conf.d