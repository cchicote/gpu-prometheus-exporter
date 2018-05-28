# Building stage
FROM golang:1.10 AS build-env
MAINTAINER Kyle Bai <k2r2.bai@gmail.com>

ENV GOPATH "/go"
ENV PROJECT_PATH "$GOPATH/src/github.com/kairen/nv-prometheus-exporter"

COPY . $PROJECT_PATH
RUN go get -u github.com/golang/dep/cmd/dep && \
  cd $PROJECT_PATH && dep ensure && go build -o /tmp/nv-prometheus-exporter

# Running stage
FROM nvidia/cuda:9.1-runtime-ubuntu16.04
COPY --from=build-env /tmp/nv-prometheus-exporter /bin/nv-prometheus-exporter
ENTRYPOINT ["/bin/nv-prometheus-exporter"]
