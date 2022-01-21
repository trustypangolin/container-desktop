#!/usr/bin/env bash

# docker buildx build --platform linux/amd64 -t papina/container-desktop:toast -f dockerfile-core-debian .
# docker buildx build --platform linux/amd64,linux/arm64 -t papina/container-desktop:debian-aws -f dockerfile-aws-debian .

# docker buildx build --platform linux/amd64 -t papina/container-desktop:centos -f dockerfile-core-centos .

# docker buildx build --platform linux/arm64 -t papina/container-desktop:debian -f dockerfile-core-debian .
# docker buildx build --platform linux/arm64 -t papina/container-desktop:centos -f dockerfile-core-centos .
# docker buildx build --platform linux/arm64 -t papina/container-desktop:debian-aws -f dockerfile-aws-debian .
# docker buildx build --platform linux/arm64 -t papina/container-desktop:centos-aws -f dockerfile-aws-centos .

# docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest papina/container-desktop:debian