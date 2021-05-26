#!/usr/bin/env bash
echo "Content-type: text/html"
echo ""
DOCUMENT=$DOCUMENT_ROOT$DOCUMENT_URI
if test -f "$DOCUMENT"; then
    awk -f "./parser.awk" $DOCUMENT $@
else
    echo '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN"><html><head><title>404 Not Found</title></head><body><h1>404 Not Found</h1><hr><p>The requested URL was not found on this server.</p></body></html>'
fi
