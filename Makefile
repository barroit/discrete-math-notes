# SPDX-License-Identifier: GPL-3.0-or-later

prefix ?= build
name   ?= notes

input  := $(name).tex
output := $(prefix)/$(name).pdf
toc    := $(prefix)/$(name).toc

input += $(shell find chapter -name '*.tex')

.PHONY: $(output)

$(output):

$(prefix):
	mkdir -p $@

$(output): $(input) $(prefix)
	lualatex --output-directory=$(prefix) --jobname=$(name) $<
