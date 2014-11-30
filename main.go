package main

import(
  "flag"
  // or kingpin for nicer CLI
  // "gopkg.in/alecthomas/kingpin.v1"
)
var ip = flag.Int("flagname", 1234, "help message for flagname")
// var debug   = kingpin.Flag("debug", "Enable debug mode.").Bool()


func main(){
  flag.Parse()
  //kingpin.Parse()
  println(*ip)
}

