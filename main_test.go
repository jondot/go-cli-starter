package main
import (
  . "gopkg.in/check.v1"
)

type CLISuite struct{}
var _ = Suite(&CLISuite{})

func (s *CLISuite) TestFoobar(c *C) {
  //should fail - fix me!
  c.Check(42, Equals, 0)
}


