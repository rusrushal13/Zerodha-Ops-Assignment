.PHONY: build

BIN := demo.bin
VERSION := 1

export DEMO_REDIS_ADDR=localhost:6379
export DEMO_APP_ADDR=:8000

build:
	go build -o ${BIN} -ldflags="-X 'main.version=${VERSION}'"

run:
	./${BIN}