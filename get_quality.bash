#!/usr/bin/bash

set -e

githashes=(
    "8bab836c4913455e0a7b82bf260bd46f385330f2"  # Improved develop with timing function
    "19fdd3cdfcd8cb0e60788ecc8cd6136d23e93d7e"  # Add polars energy ratio
    "de693739a38e2f5595928709b63a5992825def18"
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
