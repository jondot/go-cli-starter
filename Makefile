
VERSION := $(shell cat VERSION)
ARCHS := "linux/amd64 linux/arm linux/arm64 darwin/amd64"
GLIDE := $(shell command -v glide 2> /dev/null)
CARPET := $(shell command -v go-carpet 2> /dev/null)
MT := $(shell command -v multitail 2> /dev/null)
PWD := $(shell cd .. && pwd)

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
	@gometalinter --deadline=15s

test:
	@go test -cover

coverage:
	@go-carpet

build:
	@go build

release:
	@LDFLAGS='-X main.VERSION=${VERSION}' gox -osarch=${ARCHS} -output=build/{{.Dir}}_v${VERSION}_{{.OS}}_{{.Arch}}/{{.Dir}}
	@cd build && find . -type d -mindepth 1 -exec tar czf {}.tar.gz {} \;
	@rm -rf release
	@mkdir release
	@mv build/*.tar.gz release/
	@rm -rf build
	ls -la release
	
eject:
	@echo Ejecting will remove traces of go-cli-starter and
	@echo use your own project name.
	@echo
	@echo We will *reset the git history* for this repo.
	@echo
	@echo If you committed changes, you have done so for 
	@echo the original go-cli-stater.
	@echo If so, feel free to bail out now with Ctrl-C and fix it.
	@echo
	@read -p "Project name (Ctrl-C to abort): " name; \
		echo ejecting into $$name; \
		sed -E -i '' "s/go-cli-starter/$$name/" *.go; \
		rm -rf .git; git init .; git add .; git commit -am "initial import";\
		cd ..; mv go-cli-starter $$name; \
		echo; echo Done. please reset your shell with:;\
		echo \
		;echo cd ..\
	 	;echo cd $$name

.PHONY: test build release setup install watch lint mocks coverage eject
