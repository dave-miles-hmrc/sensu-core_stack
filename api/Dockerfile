FROM hmrc/sensu:1.9

ENV API_USER=WqNu4awAaNoP API_PASS=abcXvzSqoSw7
EXPOSE 4567

COPY conf.d /etc/sensu/conf.d/

CMD dockerize -template /etc/sensu/conf.d/api.tmpl:/etc/sensu/conf.d/api.json \
	-wait tcp://$RABBITMQ_PORT_5672_TCP_ADDR:5672 \
	-wait tcp://$REDIS_PORT_6379_TCP_ADDR:6379 \
	/usr/local/bundle/bin/sensu-api -d /etc/sensu/conf.d