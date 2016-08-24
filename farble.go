package main

import (
	"fmt"
)

type Countable interface {
	Inc() int
}

type Counter struct {
	count int
}

func (c *Counter) Inc() int {
	c.count = c.count + 1
	return c.count
}

type Farble struct {
	Froop  int
	Metric Countable
}

func NewFarble(c Countable) *Farble {
	return &Farble{Metric: c}
}

func (f *Farble) Bumple() {
	fmt.Printf("Cool numbers: %v, Froop: %v", f.Metric.Inc(), f.Froop)
}
