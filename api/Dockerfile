FROM dave-miles-hmrc/sensu:1.9

EXPOSE 4567

COPY conf.d /etc/sensu/conf.d/

CMD dockerize -template /etc/sensu/conf.d/api.tmpl:/etc/sensu/conf.d/api.json \
	-wait tcp://$REDIS_PORT_6379_TCP_ADDR:6379 \
	/usr/local/bundle/bin/sensu-api -d /etc/sensu/conf.d