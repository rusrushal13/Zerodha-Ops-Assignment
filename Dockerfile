FROM golang:alpine

LABEL maintainer="Rushal Verma <rusrushal13@gmail.com>"

WORKDIR /app

COPY . .

RUN go mod download

ENV DEMO_APP_ADDR=:8000

RUN go build -o main .

CMD ["./main"]