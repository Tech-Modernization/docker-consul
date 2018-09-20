# Consul Official Image Build

The version of this hosted on [HashiCorp's Docker Hub for Consul](https://hub.docker.com/r/hashicorp/consul/)
is built from the same source as the [Consul Official Image](https://hub.docker.com/_/consul/).

There are several pieces that are used to build this image:

* We start with an Alpine base image and add CA certificates in order to reach
  the HashiCorp releases server. These are useful to leave in the image so that
  the container can access Atlas features as well.
* Finally a specific Consul build is fetched and the rest of the Consul-specific
  configuration happens according to the Dockerfile.


## Adaptations for Enterprise

The following documents the changes necessary for Consul.


#### URLs

* Linux: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/consul/ent/1.2.3/consul-enterprise_1.2.3%2Bent_linux_amd64.zip
* Checksums: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/consul/ent/1.2.3/consul-enterprise_1.2.3%2Bent_SHA256SUMS
* Signature: https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/consul/ent/1.2.3/consul-enterprise_1.2.3%2Bent_SHA256SUMS.sig

#### Licensing

The Consul license will need to be applied within 30 minutes of startup.

    curl \
      --request PUT \
      --data @consul.license \
      http://127.0.0.1:8500/v1/operator/license

* https://www.consul.io/docs/enterprise/index.html#licensing
* https://www.consul.io/api/operator/license.html
