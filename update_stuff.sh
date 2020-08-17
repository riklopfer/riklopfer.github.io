#!/usr/bin/env bash

LOC=$(dirname $0)

# Regenerate the file
# Commit
# Push
$HOME/.virtualenvs/covid-testing/bin/python \
../covid-testing/plot_data.py \
	"Contra Costa,CA" "CA" "Allegheny,PA" "PA" "Clark,OH" "OH" "Fairfield,CT" "CT" "USA" \
	--metrics=tests100k,positive-test-rate,cases100k,deaths100k \
	--windows=14,7 \
	--start="2020-03-8" \
	--out_file=$LOC/kovid-dashboard.html \
&& git -C $LOC/ \
	commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git -C $LOC push

