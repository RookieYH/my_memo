#!/usr/bin/env bash

mkdir -p ${GOPATH}/src/github.com/golang
cd ${GOPATH}/src/github.com/golang
git clone https://github.com/golang/tools.git tools
mkdir -p ${GOPATH}/src/golang.org/x/tools
mv -T ./tools ${GOPATH}/src/golang.org/x/tools
cd ${GOPATH}/src/golang.org/x
git clone https://github.com/golang/lint.git

go install github.com/ramya-rao-a/go-outline

go install github.com/acroca/go-symbols

go install golang.org/x/tools/cmd/guru

go install golang.org/x/tools/cmd/gorename

go install github.com/sqs/goreturns

go install github.com/golang/lint/golint