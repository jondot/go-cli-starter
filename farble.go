package main

import (
	"fmt"
)

//Countable fixme
type Countable interface {
	Inc() int
}

//Counter fixme
type Counter struct {
	count int
}

//Inc fixme
func (c *Counter) Inc() int {
	c.count = c.count + 1
	return c.count
}

//Farble fixme
type Farble struct {
	Froop  int
	Metric Countable
}

//NewFarble fixme
func NewFarble(c Countable) *Farble {
	return &Farble{Metric: c}
}

//Bumple fixme
func (f *Farble) Bumple() {
	fmt.Printf("Cool numbers: %v, Froop: %v", f.Metric.Inc(), f.Froop)
}
