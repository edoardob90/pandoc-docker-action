#!/bin/bash -l

output=$(/usr/local/bin/pandoc -f html -t gfm --wrap=preserve "$1" | \
    awk '{
        if ($0 ~ /<div role="main">/) {
            getline
            while ($0 !~ /^To play/) {
                if ($0 ~ /^#+/) {
                    title=substr($0, index($0, "Day"))
                    sub(/---/, "", title)
                    printf("# %s\n", title)
                } else print $0
                getline
            }
        }
    }'
)

echo "::set-output name=markdown::$output"

