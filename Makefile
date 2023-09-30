USER = berdyshdev2
REPO = docker_alpine_syslog_ng
TAG = latest
NAME = work

all:    build run

build:
	docker build -f Dockerfile --tag=${TAG} --rm=true .

run:
	docker run -it --rm ${TAG}



