FROM dave-miles-hmrc/sensu-client:1.9

COPY conf.d /etc/sensu/conf.d/

CMD dockerize \
	-template /etc/sensu/conf.d/transport.tmpl:/etc/sensu/conf.d/transport.json \
	-template /etc/sensu/conf.d/client.tmpl:/etc/sensu/conf.d/client.json \
	-wait tcp://$REDIS_PORT_6379_TCP_ADDR:6379 \
	/usr/local/bundle/bin/sensu-client -d /etc/sensu/conf.d