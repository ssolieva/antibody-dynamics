#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
	--name "Ab3F8_naive_VC" \
	--hc_start 1 --hc_end 119 \
	--lc_start 1 --lc_end 101 \
	--r1 'SYG' --r2 'AGGSTN' --r3 'RGGHYGY' --chain 'HC'\

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab3F8_I56S_VC" \
        --hc_start 1 --hc_end 119 \
        --lc_start 1 --lc_end 101 \
        --r1 'NYG' --r2 'AGGSTN' --r3 'RGGHYGY' --chain 'HC'\

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab3F8_mature_VC" \
        --hc_start 1 --hc_end 119 \
        --lc_start 1 --lc_end 101 \
        --r1 'NYG' --r2 'AGGITN' --r3 'RGGHYGY' --chain 'HC' \

