#!/bin/bash
sudo docker run --rm -it \
    -v "$GOPATH":/gopath \
    -v "$(pwd)":/app \
    -e "GOPATH=/gopath" \
    -w /app \
    sayden/golang-zeromq sh -c 'CGO_ENABLED=1 go build -a --installsuffix cgo --ldflags="-s" -o app'
