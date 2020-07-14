#!/usr/bin/env bash

# Regenerate the file
# Commit
# Push
/home/rklopfer/.virtualenvs/covid-testing/bin/python \
~/Work/Source/Git/GitHub/covid-testing/plot_data.py \
	"Contra Costa,CA" "Allegheny,PA" "Clark,OH" "Fairfield,CT" "CA" "PA" "OH" "CT" "USA" \
	--metric=cases100k \
	--window=7 \
	--start="2020-03-8" \
	--out_file=/home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/kovid-dashboard.html \
&& git -C /home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/ \
	commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git push

