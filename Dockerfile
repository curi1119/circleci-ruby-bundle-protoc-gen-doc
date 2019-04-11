FROM golang:1.12.3-stretch as protoc-gen-doc

RUN apt update -y && apt install -y unzip
RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip
RUN unzip protoc-3.7.1-linux-x86_64.zip

FROM circleci/ruby:2.6.2

COPY --from=protoc-gen-doc /go/bin/protoc-gen-doc /usr/local/bin/
COPY --from=protoc-gen-doc /go/bin/protoc /usr/local/bin/
COPY --from=protoc-gen-doc /go/include/google /usr/local/include/google
