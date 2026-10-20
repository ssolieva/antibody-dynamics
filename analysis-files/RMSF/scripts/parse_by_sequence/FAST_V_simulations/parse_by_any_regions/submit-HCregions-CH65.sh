#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_naive_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'TGYY' --r2 'NPNSGGTN' --r3 'EPRSVDYYYY' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_I2_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'TDYY' --r2 'HPNSGGTN' --r3 'EPRSVDYYYY' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH65_mature_V" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --r1 'TDYH' --r2 'HPNSGDTN' --r3 'EPRSVDYYYY' --chain 'HC' \

