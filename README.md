&nbsp;

<div align="center">

<img src="https://raw.githubusercontent.com/AgnostiqHQ/covalent/master/doc/source/_static/covalent_readme_banner.svg" width=150%>

</div>

## Covalent Docker Development Images

This repository contains a set of Dockerfiles which can be used to develop, build, and run Covalent. These images will not change very often, as they are used to set up build environments but do not include the actual dependencies of Covalent. The following environments are included:

- All combinations of Debian 10, 11 and Python 3.8, 3.9, 3.10
- CentOS 7 and Python 3.8

To build a single one of these images locally, e.g., Debian 10 with Python 3.8, run the following:

```
docker build ./debian10-py38
```

To build all images and upload them to ECR, use the Makefile:

```
make
make clean # Deletes the local images
```

To pull an image from ECR and use it:

```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin xxxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com
docker pull xxxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/covalent-bld:debian10-py38
```

Run the image and clone Covalent, and then install it:
```
docker run --rm -it -p 8080:48008 covalent-bld:debian10-py38 /bin/bash
git clone https://github.com/AgnostiqHQ/covalent.git

python setup.py webapp
pip install -e .
covalent start
```

You can either submit workflows to port 48008 on `0.0.0.0` from directly inside the container, or you can submit them from the Docker host to port `8080`.

Don't forget to run `git config` inside the container if you intend to commit any changes!
