FROM dave-miles-hmrc/sensu:1.9

COPY conf.d /etc/sensu/conf.d/

CMD dockerize -template /etc/sensu/conf.d/server.tmpl:/etc/sensu/conf.d/server.json \
	-wait tcp://$REDIS_PORT_6379_TCP_ADDR:6379 \
	/usr/local/bundle/bin/sensu-server -d /etc/sensu/conf.d