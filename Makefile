SHELL := /bin/sh

PATHDIR ?= /usr/local/bin

.PHONY: install

all: install

install:
	cp ./kubectl-checkusage $(PATHDIR)/