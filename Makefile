# Automatisation du déploiement

install-tools:
	sudo apt update
	sudo apt install packer ansible -y

build:
	packer init build.pkr.hcl
	packer build build.pkr.hcl
	k3d image import my-nginx:v1 -c lab

deploy:
	ansible-playbook deploy_custom.yml

all: build deploy