FROM golang:1.23-alpine3.20

RUN apk add --no-cache make build-base libpcap-dev openssh-client tcpdump

WORKDIR /app
COPY . /app

ENV GOTOOLCHAIN=auto

RUN go mod download
RUN go build .

ENTRYPOINT ["./pcap-broker"]
