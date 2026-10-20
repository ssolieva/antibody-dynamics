#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_naive_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'NIGS' --r2 'WDSSSD'  --chain 'LC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_I2_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'NIGS' --r2 'WDSSSD' --chain 'LC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_mature_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'DIGR' --r2 'WDSSSD'  --chain 'LC'

