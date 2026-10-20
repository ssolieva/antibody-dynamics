#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "EPTC112_naive_VC" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 110 \
	--r1 'SGGSVSSY' --r2 'YYSG' --r3 'SVDTSKNQFS' --r4 'RGYSSGW' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "EPTC112_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 110 \
        --r1 'FNSRVSGY' --r2 'HFSL' --r3 'SIDTERYQVF' --r4 'RGDASGW' --chain 'HC' \

