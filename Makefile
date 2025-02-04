.DEFAULT_GOAL := build-all

build-all: pb

build:
	@rm -rf bin
	@go build -o bin/server server/main.go
	@go build -o bin/client client/main.go

pb:
	@protoc -I ./proto helloworld.proto --go_out=plugins=grpc:helloworld
	@protoc -I ./proto helloworld.proto --gofast_out=plugins=grpc:helloworld
	@ls helloworld

gopb:
	@protoc -I ./proto helloworld.proto --gofast_out=plugins=grpc:helloworld
	@ls helloworld

clean:
	@echo "清理"
