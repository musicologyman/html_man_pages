#!/bin/bash

asciidoctor -a linkcss "$1"
tidy -i -m ${1%%.adoc}.html
