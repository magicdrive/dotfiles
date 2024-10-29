#! /bin/bash

set -e

export GO111MODULE=on
go clean --modcache
go install "github.com/magicdrive/kirke@latest"


exit 0
