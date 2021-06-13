#!/bin/bash
VERSION=5.2.1.b

docker build
docker build -t diddado/revive:${VERSION} .
docker push diddado/revive:${VERSION}