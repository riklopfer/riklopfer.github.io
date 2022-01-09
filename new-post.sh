#!/usr/bin/env bash
THIS_LOC=$(cd $(dirname $0); echo $PWD)

POST_NAME="$@"

if [[ $POST_NAME ]]; then
    (cd $THIS_LOC; bundle exec jekyll post "$POST_NAME")
else
    echo "USAGE: $(basename $0) name of the post"
fi
