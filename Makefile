
VERSION := $(shell cat VERSION)
ARCHS := "linux/amd64 linux/arm linux/arm64 darwin/amd64"
GLIDE := $(shell command -v glide 2> /dev/null)
CARPET := $(shell command -v go-carpet 2> /dev/null)
MT := $(shell command -v multitail 2> /dev/null)

default: build

setup:
	@echo installing gox, metalinter, reflex and mockery...
	@go get github.com/mitchellh/gox
	@go get github.com/alecthomas/gometalinter
	@go get github.com/cespare/reflex/...
	@go get github.com/vektra/mockery/...
	@echo installing carpet and glide...
ifndef CARPET
	@brew tap msoap/tools
	@brew install go-carpet
endif
ifndef GLIDE
	@brew install glide
endif
ifndef MT
	@brew install multitail
endif

mocks:
	@mockery -name Countable

install:
	@glide install

watch:
	@multitail -cT ANSI -l "reflex -r '\.go' make test" \
	-cT ANSI -l "reflex -r '\.go' make lint" \

lint:
	@gometalinter

test:
	@go test -cover

coverage:
	@go-carpet

build:
	@go build

dist:
	@LDFLAGS='-X main.VERSION=${VERSION}' gox -osarch=${ARCHS} -output=build/{{.Dir}}_v${VERSION}_{{.OS}}_{{.Arch}}/{{.Dir}}
	@cd build && find . -type d -mindepth 1 -exec tar czf {}.tar.gz {} \;
	@rm -rf release
	@mkdir release
	@mv build/*.tar.gz release/
	@rm -rf build
	ls -la release
	
eject:
	@read -p "Project name (Ctrl-C to abort): " name; echo ejecting $$name

.PHONY: test build dist setup install watch lint mocks coverage
