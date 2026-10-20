#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
	--name "Ab118_naive_VC" \
	--hc_start 1 --hc_end 125 \
	--lc_start 1 --lc_end 108 \
	--r1 'RASQSVSSSY' --r2 'GSGTD' --r3 'QYGSSP' --chain 'LC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_I_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
	--r1 'RASQGLSSSH' --r2 'GSGTD' --r3 'RYGSTP' --chain 'LC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_IAb2748_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
	--r1 'RASQGLSSSH' --r2 'GSGTA' --r3 'RYGNTP' --chain 'LC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_IAb0923_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
	--r1 'RASEGLDSSQ' --r2 'GSGAD' --r3 'RFGATP' --chain 'LC'

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_mature_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
	--r1 'RASQGLDSSH' --r2 'GSGAD' --r3 'RYGGTP' --chain 'LC'






