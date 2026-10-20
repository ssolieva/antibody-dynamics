#!/bin/bash

#python parse_and_save_avg_data_for_any_regions.py \
#	--name "CH103_naive_VC" \
#	--hc_start 1 --hc_end 121 \
#	--lc_start 1 --lc_end 108 \
#	--r1 'SISSYY' --r2 'YIYYSGSTNY' --r3 'VTISVDTSKN' --r4 'KLS' --r5 'RGQLVN' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 105 \
	 --r1 'SMGGTY' --r2 'YIFHTGETNY' --r3 'VSISVDTSED' --r4 'RLR' --r5 'RGQLVN' --chain 'HC' \

#python parse_and_save_avg_data_for_any_regions.py \
#	--name "CH103_naive_VC" \
#	--hc_start 1 --hc_end 121 \
#	--lc_start 1 --lc_end 108 \
#	--r1 'LGD' --r2 'QDSK' --r3 'SNS' --r4 'WDSF' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 105 \
	--r1 'TN' --r2 'ENYK' --r3 'SKS' --r4 'WDSF' --chain 'LC' \

