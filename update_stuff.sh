#!/usr/bin/env bash

LOC=$(dirname $0)

# Pull
# Regenerate the file
# Commit
# Push
git -C $LOC pull \
&& ${LOC}/../covid-testing/plot_data.py \
	"Contra Costa,CA" "Allegheny,PA" "Clark,OH" "Fairfield,CT" "USA" \
	--metrics=cases100k,deaths100k,positive-test-rate,tests100k \
	--windows=7 \
	--start="2020-03-8" \
	--out_file=$LOC/kovid-dashboard.html \
&& git -C $LOC/ \
	commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git -C $LOC push

