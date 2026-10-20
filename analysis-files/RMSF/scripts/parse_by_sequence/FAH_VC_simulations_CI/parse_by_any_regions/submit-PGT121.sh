#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_naive_lambda_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 109 \
        --r1 'KRIYGVVSFGDYYYYYY'  --chain 'HC' 

#python parse_and_save_avg_data_for_any_regions.py \
#        --name "PGT121_mature_lambda_VC" \
#        --hc_start 1 --hc_end 132 \
#        --lc_start 1 --lc_end 105 \
#	--r1 'RRIYGIVAFNEWFTYFY'  --chain 'HC'


python parse_and_save_avg_data_for_any_regions.py \
        --name "PGT121_naive_lambda_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 109 \
        --r1 'IGSKS' --r2 'YDDSD' --r3 'NSG' --r4 'DSSSDHP' --chain 'LC'

#python parse_and_save_avg_data_for_any_regions.py \
#        --name "PGT121_mature_lambda_VC" \
##        --hc_start 1 --hc_end 132 \
#        --lc_start 1 --lc_end 105 \
#        --r1 'LGSRA' --r2 'YNNQD' --r3 'PDSPFG' --r4 'DSRVPT' --chain 'LC'



