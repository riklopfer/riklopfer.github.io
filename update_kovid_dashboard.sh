#!/usr/bin/env bash
set -e

LOC="$(dirname $0)"

git -C $LOC pull

# Make sure we have what we need
# clone or update testing repo
PLOTS_CODE="$LOC/covid-plots"
if [[ -d "${PLOTS_CODE}" ]]; then
  echo "Pulling repo ${PLOTS_CODE}"
  git -C ${PLOTS_CODE} pull --ff-only 
else
  echo "Cloning repo to ${PLOTS_CODE}"
  git clone https://github.com/riklopfer/covid-plots.git ${PLOTS_CODE}
fi

# check for venv 
VENV_DIR="$LOC/.venv"
if [[ -d  "${VENV_DIR}" ]]; then
  echo "venv ${VENV_DIR} exists"
else
  echo "creating venv ${VENV_DIR}"
  python3 -m venv "${VENV_DIR}"
  ${VENV_DIR}/bin/pip install -U pip
fi

${VENV_DIR}/bin/pip install -Ur ${PLOTS_CODE}/requirements.txt

# Regenerate the file
# Pull
# Commit
# Push
# deprecated: ,positive-test-rate,tests100k
${VENV_DIR}/bin/python ${PLOTS_CODE}/plot_data.py \
  "Contra Costa,CA" "Allegheny,PA" "Clark,OH" "Fairfield,CT" "USA" \
  --metrics=cases100k,deaths100k \
  --windows=7 \
  --start="2020-03-8" \
  --out_file=$LOC/kovid-dashboard.html \
&& git -C $LOC pull \
&& git -C $LOC/ \
  commit -m "updating kovid-dashboard" kovid-dashboard.html \
&& git -C $LOC push
