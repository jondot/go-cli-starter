# Go CLI Starter

This is a Go based command line interface starter app (CLI).

Included

* Testing/Mocking: gocheck + testify/mock
* CLI Opts: flag (stdlib) / kingpin
* Packaging: custom crosscompilation via `make dist` (Rakefile)
* Dependencies: Gom



## Quick Start

Clone this project, then `rm -rf .git`.

```bash
$ git clone https://github.com/jondot/go-cli-starter
$ mv go-cli-starter my-project && cd my-project
$ rm -rf .git # you should be within my-project
$ make build
```

`make` should be your entry point.

* `make build` - build
* `make test` - test
* `make dist` - build and package binaries for multiple platforms

Note: You should edit your binary name in `Rakefile`.


# Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).


# Copyright

Copyright (c) 2014 [Dotan Nahum](http://gplus.to/dotan) [@jondot](http://twitter.com/jondot). See MIT-LICENSE for further details.



