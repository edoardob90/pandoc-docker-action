#!/bin/bash -l

dest=${1}
year=${2:-$(date +%Y)}
day=${3:-$(date +%-d)} # '-' means "don't pad with zeroes"

mkdir -p "$day"

/usr/local/bin/pandoc -f html -t gfm --wrap=preserve "https://adventofcode.com/$year/day/$day" | \
    awk '{
        if ($0 ~ /<div role="main">/) {
            getline
            while ($0 !~ /^To play/) {
                print $0
                getline
            }
        }
    }' > $day/$dest
