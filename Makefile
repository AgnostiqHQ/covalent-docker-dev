REGION=us-east-1
REGISTRY=348041629502.dkr.ecr.$(REGION).amazonaws.com
REPOSITORY=covalent-bld
DOCKERFILES=$(shell find . -type f -name Dockerfile)
IMAGES=$(subst /,\:,$(subst /Dockerfile,,$(DOCKERFILES)))

.PHONY: all login clean

all: $(IMAGES)

login:
	which aws
	aws sts get-caller-identity &> /dev/null
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(REGISTRY) &> /dev/null

$(IMAGES): %: login
	docker build -t $(REGISTRY)/$(subst .,$(REPOSITORY),$@) $(subst :,/,$@)
	docker push $(REGISTRY)/$(subst .,$(REPOSITORY),$@)

clean:
	images=$$(docker images --filter=reference="*/$(REPOSITORY):*" -q) && \
	[[ $$(wc -l <<< $$images) -gt 0 ]] && \
	docker rmi $$images
