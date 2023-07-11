#!/usr/bin/bash

set -e

githashes=(
    "50705951a464a6015a6abb5cc684e5a08c1e20fc"  # Develop
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
