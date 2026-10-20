#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
	--name "CH103_naive_V" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 108 \
	--r1 'SISSYY' --r2 'YIYYSGSTNY' --r3 'VTISVDTSKN' --r4 'KLS' --r5 'RGQLVN' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_I32_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 2 --lc_end 108 \
	--r1 'SMGGYY' --r2 'YIFHTGHTNY' --r3 'VTVSVDTSEN' --r4 'RLR' --r5 'RGQLVN' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_I2_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 108 \
	--r1 'SMGGTY' --r2 'YIFHTGHTNY' --r3 'VSISVDTSED' --r4 'RLR' --r5 'RGQLVN' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_mature_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 105 \
	 --r1 'SMGGTY' --r2 'YIFHTGETNY' --r3 'VSISVDTSED' --r4 'RLR' --r5 'RGQLVN' --chain 'HC' \



