CONSUL_VERSION?=1.2.3

build:
	cd 0.X && \
		docker build \
			--build-arg CONSUL_VERSION=$(CONSUL_VERSION) \
			-t consul-enterprise:$(CONSUL_VERSION) .
