#!/bin/bash -l

day=$(date +%d)
dest=${1:-prompt_${day}.md}

/usr/local/bin/pandoc -f html -t gfm --wrap=preserve "https://adventofcode.com/2021/day/$day" | \
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
    }' > ${GITHUB_WORKFLOW}/$dest
