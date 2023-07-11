#!/usr/bin/bash

set -e

githashes=(
    "5fcffba5622caff81b07f72a25cd0d0ec5e64a55"  # First commit with timing tests included
)

# base_dir=`pwd`
base_dir="/Users/pfleming/Projects/FLORIS"

# conda activate floris

for hash in "${githashes[@]}"; do
    cd $base_dir/flasc
    git checkout $hash 1> /dev/null 2> /dev/null   # redirect stdout and stderr to dev null - stderr prints things that arent errors
    # pip install -e . 1> /dev/null   # redirect stdout to dev null
    git rev-parse --short HEAD
    cd $base_dir
    python $base_dir/flasc_metrics/quality_metrics.py $hash
done
