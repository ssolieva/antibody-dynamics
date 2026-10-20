#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "CAP256_naive_V" \
	--hc_start 1 --hc_end 144 \
	--lc_start 1 --lc_end 111 \
	--r1 'GFTFSSY' --r2 'LGESENEEWATDYYDFSIGYPGQDPR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I01_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'GFTFSNF' --r2 'VGDYKSDEWGTEYYDISISYPIQDPR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I03_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'RFSFNRY' --r2 'LREDECEEWWSDYYDFGKQLPCRKSR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I04_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'QFSFNRY' --r2 'LREDECEEWWSDYYDFGKQLPCRKSR' --chain 'HC' \


python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_V" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'QFRFDGY' --r2 'LREDECEEWWSDYYDFGKQLPCAKSR' --chain 'HC' \


