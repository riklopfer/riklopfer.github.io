#!/usr/bin/env bash

# Regenerate the file
# Commit
# Push
/home/rklopfer/.virtualenvs/covid-testing/bin/python \
~/Work/Source/Git/GitHub/covid-testing/plot_data.py \
	"Contra Costa,CA" "CA" "Allegheny,PA" "PA" "Clark,OH" "OH" "Fairfield,CT" "CT" "USA" \
	--metrics=cases100k,deaths100k \
	--windows=14,7,0 \
	--start="2020-03-8" \
	--out_file=/home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/kovid-dashboard.html \
&& git -C /home/rklopfer/Work/Source/Git/GitHub/riklopfer.github.io/ \
	commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git push

