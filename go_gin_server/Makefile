MAKEFLAGS += --silent

dev:
	go run main.go

build:
	go build -o server -ldflags="-s -w" main.go

launch-release:
	make build
	./server
