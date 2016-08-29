package main

import (
	"github.com/jondot/go-cli-starter/mocks"
	. "gopkg.in/check.v1"
)

// benchmarks
func (s *CLISuite) BenchmarkIface(c *C) {
	for i := 0; i < c.N; i++ {
		f := NewFarble(&Counter{})
		f.Metric.Inc()
	}
}

// tests
func (s *CLISuite) TestFarble(c *C) {
	f := NewFarble(&Counter{})
	c.Check(f.Metric.Inc(), Equals, 1)
}

func (s *CLISuite) TestFarbleWithMock(c *C) {
	m := new(mocks.Countable)
	m.On("Inc").Return(42)
	f := NewFarble(m)
	c.Check(f.Metric.Inc(), Equals, 42)
}
