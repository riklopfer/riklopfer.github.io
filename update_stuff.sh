#!/usr/bin/env bash

# Regenerate the file
/home/rklopfer/.virtualenvs/covid-testing/bin/python \
~/Work/Source/Git/GitHub/covid-testing/plot_data.py \
	"Contra Costa,CA" "Allegheny,PA" "Clark,OH" "Fairfield,CT" \
	--metric=cases100k \
	--window=7 \
	--out_file=/home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/stuff.html

# Push to github
git -C /home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/ \
	commit -m "updating stuff" stuff.html \
&& git push

