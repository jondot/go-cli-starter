package main

import "flag"

// or kingpin for nicer CLI

var VERSION = "dev"

var ip = flag.Int("flagname", 1234, "help message for flagname")

// var debug   = kingpin.Flag("debug", "Enable debug mode.").Bool()

func main() {
	flag.Parse()

	f := NewFarble(&Counter{})

	f.Bumple()

	//kingpin.Parse()
	println(*ip)

}
