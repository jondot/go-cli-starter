package main

import (
	"flag"
	"gopkg.in/alecthomas/kingpin.v2"
)

// or kingpin for nicer CLI

// VERSION gets overwritten by release target
var VERSION = "dev"
var _ = VERSION

var ip = flag.Int("flagname", 1234, "help message for flagname")
var debug = kingpin.Flag("debug", "Enable debug mode.").Bool()

func main() {
	flag.Parse()
	app := kingpin.New("completion", "My application with bash completion.")

	f := NewFarble(&Counter{})

	f.Bumple()

	//kingpin.Parse()
	println(*ip)

}
