#!/bin/bash
#================================================
# Library version.
#================================================
function version() {
    echo "1.0.0"
}

#================================================
# Hello World!
#================================================
function hello_world() {
    echo "Hello World!"
}

#================================================
# Show system date.
#================================================
function date() {
    sh -c "date +$1"
}

#================================================
# Print command.
#================================================
function print() {
    echo $@
}

$@
