FROM golang:1.11-stretch as protoc-gen-doc

RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

FROM circleci/ruby:2.5.3

COPY --from=protoc-gen-doc /go/bin/protoc-gen-doc /usr/local/bin/
