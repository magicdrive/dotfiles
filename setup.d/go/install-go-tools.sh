#! /bin/bash

set -e

mkdir -p ~/projects/gocode/src
mkdir -p ~/.gopath ~/.gopath/src ~/.gopath/bin ~/.gopath/pkg

export GO111MODULE=on

go clean --modcache

TOOLS=(
  "github.com/mdempsky/gocode"
  "golang.org/x/tools/gopls"
  "golang.org/x/tools/cmd/goimports"
  "golang.org/x/tools/cmd/guru"
  "golang.org/x/tools/cmd/gorename"
  "github.com/rogpeppe/godef"
  "golang.org/x/lint/golint"
  "github.com/kisielk/errcheck"
  "github.com/jstemmer/gotags"
  "github.com/fatih/gomodifytags"
  "github.com/josharian/impl"
  "github.com/haya14busa/goplay/cmd/goplay"
  "github.com/go-delve/delve/cmd/dlv"
  "github.com/mgechev/revive"
  "honnef.co/go/tools/cmd/staticcheck"
  "mvdan.cc/gofumpt"
  "github.com/incu6us/goimports-reviser/v3"
  "github.com/koron/iferr"
  "github.com/magicdrive/kirke"
  "github.com/pilu/fresh"
  "github.com/mattn/goreman"
)

echo "Install golang tools..."

for tool in "${TOOLS[@]}"; do
  echo "Installing: $tool"
  go install "$tool@latest"
  echo
  echo
done


echo Install complete!


exit 0
