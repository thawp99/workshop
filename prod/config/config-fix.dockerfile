FROM golang:1.12-stretch
ADD config.go /build/config.go
RUN go build -o /build/config /build/config.go

FROM quay.io/gravitational/debian-tall:0.0.1
COPY --from=0 /build/config /config
ENTRYPOINT ["/usr/bin/dumb-init", "/config", "/opt/config/config.yaml"]
