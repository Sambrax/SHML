#!/usr/bin/awk -f
#========================================
# Add the standard library path.
#========================================
{
    if ($0 ~ /.*(<%.* %>).*/) {
        sub(/<%/,"<% ./stdlib.sh")
        sub(/\(\.*/," ")
        sub(/)\.*/,"")
        execute_command()
    }
}

#========================================
# Remove the tags.
#========================================
function strip_tags(tag) {
    gsub(/(<%(|\s)\s*)|(%>)/, "", tag)
    return tag
}

#========================================
# Runs the commands from the library.
#========================================
function execute_command() {
    match($0, /<%.*%>/, tags)
    strip_tags(tags[0]) | getline output
    gsub(tags[0], output, $0)
}

#========================================
# Remove the HTML comments.
#========================================
/<!--/ {f=1} !f; /-->/ {f=0}
