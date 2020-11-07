#!/usr/bin/env bash
LOC="$(dirname $0)"

# Make sure we have what we need
# clone or update testing repo
REPO_LOC="$LOC/covid-plots"
if [[ -d "$REPO_LOC" ]]; then
  echo "Pulling repo $REPO_LOC"
  git pull --ff-only -C $REPO_LOC
else
  echo "Cloning repo to $REPO_LOC"
  git clone https://github.com/riklopfer/covid-plots.git $REPO_LOC
fi

# check for venv 
VENV_DIR="$LOC/covid-venv"
if [[ -d  "$VENV_DIR" ]]; then
  echo "venv $VENV_DIR exists"
else
  echo "creating venv $VENV_DIR"
  python3 -m venv "$VENV_DIR"
  $VENV_DIR/bin/pip install -U pip
fi

$VENV_DIR/bin/pip install -r $REPO_LOC/requirements.txt

# Pull
# Regenerate the file
# Commit
# Push
git -C $LOC pull --ff-only \
&& $VENV_DIR/bin/python ${REPO_LOC}/plot_data.py \
  "Contra Costa,CA" "Allegheny,PA" "Clark,OH" "Fairfield,CT" "USA" \
  --metrics=cases100k,deaths100k,positive-test-rate,tests100k \
  --windows=7 \
  --start="2020-03-8" \
  --out_file=$LOC/kovid-dashboard.html \
&& git -C $LOC/ \
  commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git -C $LOC push

