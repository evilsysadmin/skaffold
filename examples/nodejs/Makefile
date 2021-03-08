K3D_VERSION = v4.2.0
SKAFFOLD_VERSION = 1.20.0

install-k3d:
	./ops/scripts/install-k3d.sh ${K3D_VERSION} ${SKAFFOLD_VERSION}

delete-k3d:
	k3d cluster delete k3s-default
	docker rm registry.local -f
	
bootstrap: install-k3d
	docker container run -d --name registry.local -v local_registry:/var/lib/registry --restart always -p 5000:5000 registry:2
	k3d cluster create -s 1 --volume /home/${USER}/.k3d/registries.yaml:/etc/rancher/k3s/registries.yaml

dev:
	skaffold dev
