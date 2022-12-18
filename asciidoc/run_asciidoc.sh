#!/bin/bash

asciidoctor -a linkcss "$1" -o ../${1%%.adoc}.html
tidy -im ../${1%%.adoc}.html
