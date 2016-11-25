# zeromq-golang-docker-image
A docker image of ZeroMQ in a Go-ready environment. ZeroMQ Go libraries uses CGO to run the lower level ZMQ API. With CGO static linking is not possible so you need ZMQ libraries in your docker container to run properly you ZeroMQ app.

## Build warning
I strongly recommend to build your app using this container too. That's why it has Go environment configured. If you use your own environment you could run into potential ZeroMQ version mismatches.

Build your app with this image is easy, you can peek at the `buildCommand.sh` file in this repo:

    sudo docker run --rm -it \
        -v "$GOPATH":/gopath \
        -v "$(pwd)":/app \
        -e "GOPATH=/gopath" \
        -w /app \
        sayden/golang-zeromq sh -c 'CGO_ENABLED=1 go build -a --installsuffix cgo --ldflags="-s" -o app'

Basically it runs a docker container and runs the build command within it. An executable called `app` will appear in the same folder where you run this container once it exists.

This built binary can now be used with this image safely and without issues.

## Acknowledges
Thanks to [ogomezm](https://github.com/ogomezm) for his ZeroMQ Docker image that I have copied shamelessly to achieve this solution.
    
