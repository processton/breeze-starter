# VERSION defines the version for the docker containers.
# To build a specific set of containers with a version,
# you can use the VERSION as an arg of the docker build command (e.g make docker VERSION=0.0.2)
VERSION ?= v0.0.1

# REGISTRY defines the registry where we store our images.
# To push to a specific registry,
# you can use the REGISTRY as an arg of the docker build command (e.g make docker REGISTRY=my_registry.com/username)
# You may also change the default value if you are using a different registry as a default
REGISTRY ?= processton/breeze-starter_pack


# Commands
docker: docker-build docker-push

docker-build:
	docker build . --target cli -t ${REGISTRY}/sail:${VERSION}
	docker build . --target minio -t ${REGISTRY}/minio:${VERSION}
	docker build . --target redis -t ${REGISTRY}/redis:${VERSION}
	docker build . --target getmeili -t ${REGISTRY}/getmeili:${VERSION}
	docker build . --target mysql -t ${REGISTRY}/mysql:${VERSION}

docker-push:
	docker push ${REGISTRY}/sail:${VERSION}
	docker push ${REGISTRY}/minio:${VERSION}
	docker push ${REGISTRY}/redis:${VERSION}
	docker push ${REGISTRY}/getmeili:${VERSION}
	docker push ${REGISTRY}/mysql:${VERSION}