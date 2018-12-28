IMAGE_NAME=rcarmo/punydns:arm32v7
CONTAINER_NAME=punydns
export USERNAME=foobar@sapo.pt
export PASSWORD=secret
export DOMAIN=foobar.sl.pt
build: Dockerfile
	docker build -t ${IMAGE_NAME} .

daemon:
	docker run --name ${CONTAINER_NAME} \
	-d --restart=always \
	-e USERNAME=${USERNAME} -e PASSWORD=${PASSWORD} -e DOMAIN=${DOMAIN} \
	${IMAGE_NAME}

test:
	rootfs/punydns.sh

push:
	docker push ${IMAGE_NAME}

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)
