FROM golang:alpine AS builder

WORKDIR /go/bin

COPY app/server.go /go/bin

RUN go build server.go

FROM scratch
COPY --from=builder /go/bin/server /go/bin/server
ENTRYPOINT ["/go/bin/server"]
