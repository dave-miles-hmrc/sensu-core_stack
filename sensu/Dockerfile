FROM ruby:2.5.8

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& chown root:root /usr/local/bin/dockerize \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Install Sensu
RUN echo "install: --no-rdoc --no-ri" >> /etc/gemrc \
	&& apt-get update \
	&& gem install -N \
		rest-client \
		nokogiri \
		sensu \
		sensu-plugins-http \
		sensu-plugins-graphite \
		sensu-plugins-network-checks \
		sensu-plugins-disk-checks \
		sensu-plugins-process-checks \
		sensu-extensions-check-dependencies \
		sensu-extensions-debug \
		sensu-extensions-json \
		sensu-extensions-occurrences \
		sensu-extensions-only-check-output \
		sensu-extensions-ruby-hash \
		sensu-json \
		sensu-logger \
		sensu-redis \
		sensu-settings \
		sensu-transport \
	&& apt-get clean -y

# Update PATH to include the embedded Ruby shipped with Sensu
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bundle/bin
