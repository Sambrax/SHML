#!/bin/bash
echo "Content-type: text/html"
echo ""
awk -f "./parser.awk" $DOCUMENT_ROOT$DOCUMENT_URI $@
