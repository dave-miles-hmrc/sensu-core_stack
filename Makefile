TAG_LOCAL_REPOSITORY ?= localhost:5000/dave-miles-hmrc

.PHONY: build-all
build-all: build-sensu build-uchiwa

.PHONY: build-sensu
build-sensu:
	cd sensu  && docker build -t $(TAG_LOCAL_REPOSITORY)/sensu:1.9        -t dave-miles-hmrc/sensu:1.9 .
	cd server && docker build -t $(TAG_LOCAL_REPOSITORY)/sensu-server:1.9 -t dave-miles-hmrc/sensu-server:1.9 .
	cd client && docker build -t $(TAG_LOCAL_REPOSITORY)/sensu-client:1.9 -t dave-miles-hmrc/sensu-client:1.9 .
	cd api    && docker build -t $(TAG_LOCAL_REPOSITORY)/sensu-api:1.9    -t dave-miles-hmrc/sensu-api:1.9 .

.PHONY: build-uchiwa
build-uchiwa:
	cd uchiwa && docker build -t $(TAG_LOCAL_REPOSITORY)/uchiwa:1.4.1     -t dave-miles-hmrc/uchiwa:1.4.1 .

.PHONY: push-to-local
push-to-local:
	docker push $(TAG_LOCAL_REPOSITORY)/sensu:1.9
	docker push $(TAG_LOCAL_REPOSITORY)/sensu-server:1.9
	docker push $(TAG_LOCAL_REPOSITORY)/sensu-client:1.9
	docker push $(TAG_LOCAL_REPOSITORY)/sensu-api:1.9
	docker push $(TAG_LOCAL_REPOSITORY)/uchiwa:1.4.1

.PHONY: compose-up
compose-up:
	docker-compose up -d

.PHONY: compose-down
compose-down:
	docker-compose down
