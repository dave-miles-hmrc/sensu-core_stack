
.PHONY: build-sensu
build-sensu:
	cd sensu && docker build -t hmrc/sensu:1.9 .
	cd server && docker build -t hmrc/sensu-server:1.9 .
	cd client && docker build -t hmrc/sensu-client:1.9 .
	cd api && docker build -t hmrc/sensu-api:1.9 .
