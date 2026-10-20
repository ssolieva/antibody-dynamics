#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_naive_kappa_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 109 \
        --r1 'KRIYGVVSFGDYYYYYY'  --chain 'HC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_3H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
	--r1 'KRIYGMVSFGEFFYYYY' --chain 'HC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_32H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
	--r1 'QRIYGVVSFGEFFYYYY'  --chain 'HC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_9H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
	--r1 'RRIYGIVAFREWFTYFY'  --chain 'HC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_mature_kappa_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 105 \
	--r1 'RRIYGIVAFNEWFTYFY'  --chain 'HC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT124_mature_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 108 \
	--r1 'QRIYGVVSFGEFFYYYY' --chain 'HC'
