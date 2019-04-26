#!/bin/bash
#========================================
# Standard library version.
#========================================
function std_lib_version() {
    echo "Version: 0.0.1"
}

#========================================
# Hello World!
#========================================
function hello_world() {
    echo "Hello World!"
}

#========================================
# Show system date.
#========================================
function date() {
    sh -c "date +$1"
}

#========================================
# Print command.
#========================================
function print() {
    echo $@
}

$@
