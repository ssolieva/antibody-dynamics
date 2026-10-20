#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "EPTC112_naive_VC" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 110 \
	--r1 'NYV' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "EPTC112_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 110 \
        --r1 'DYV' --chain 'LC' \

