# Go CLI Starter

This is a Go based command line interface starter app (CLI).

Included:

* Dependency management: Glide
* Testing/Mocking: `gocheck`, `testify/mock`, `mockery` for generation.
* CLI Opts: `flag` (stdlib) or `kingpin` for POSIX.
* Packaging: cross-compilation and release packaging

Tools:

* Lint with `metalinter`
* Coverage with `go-carpet`

## Quick Start

Clone this project:

```bash
$ git clone https://github.com/jondot/go-cli-starter
$ cd go-cli-starter
```

Setup:

```bash
$ make setup
$ make install
```

Explore:

```
$ make lint
$ make test
$ make coverage
$ make mocks
$ make watch
```

Make it your own:

```
$ make eject
```


# Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).


# Copyright

Copyright (c) 2014 [Dotan Nahum](http://gplus.to/dotan) [@jondot](http://twitter.com/jondot). See MIT-LICENSE for further details.



