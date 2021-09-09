.PHONY: build-all
build-all: build-sensu build-uchiwa

.PHONY: build-sensu
build-sensu:
	cd sensu && docker build -t hmrc/sensu:1.9 .
	cd server && docker build -t hmrc/sensu-server:1.9 .
	cd client && docker build -t hmrc/sensu-client:1.9 .
	cd api && docker build -t hmrc/sensu-api:1.9 .

.PHONY: build-uchiwa
build-uchiwa:
	cd uchiwa && docker build -t hmrc/uchiwa:1.4.1 .
