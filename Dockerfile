FROM golang:1.22-alpine3.20

RUN apk add --no-cache make build-base libpcap-dev openssh-client tcpdump

WORKDIR /app
COPY . /app

RUN go mod download
RUN go build .

ENTRYPOINT ["./pcap-broker"]
