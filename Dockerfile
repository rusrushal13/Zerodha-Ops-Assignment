FROM golang:alpine

LABEL maintainer="Rushal Verma <rusrushal13@gmail.com>"

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

ENV DEMO_APP_ADDR=:8000

RUN go build -o main .

CMD ["./main"]