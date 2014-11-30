test:
	@gom test

build:
	GOOS=linux GOARCH=amd64 gom build

dist:
	@rake dist

