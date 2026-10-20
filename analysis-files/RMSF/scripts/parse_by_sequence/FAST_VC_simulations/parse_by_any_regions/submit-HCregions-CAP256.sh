#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "CAP256_naive_VC" \
	--hc_start 1 --hc_end 144 \
	--lc_start 1 --lc_end 111 \
	--r1 'GFTFSSY' --r2 'LGESENEEWATDYYDFSIGYPGQDPR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I01_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'GFTFSNF' --r2 'VGDYKSDEWGTEYYDISISYPIQDPR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I03_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'RFSFNRY' --r2 'LREDECEEWWSDYYDFGKQLPCRKSR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I04_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'QFSFNRY' --r2 'LREDECEEWWSDYYDFGKQLPCRKSR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I07_VC" \
        --hc_start 1 --hc_end 111 \
        --lc_start 1 --lc_end 144 \
        --r1 'QFSFNRY' --r2 'LREDECEEWWSDYYDFGKKLPCRKSR' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I10_VC" \
        --hc_start 1 --hc_end 111 \
        --lc_start 1 --lc_end 144 \
        --r1 'QFTFSGH' --r2 'MREYECEYWTSDYYDFGRPQPCIDRR' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_VC" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'QFRFDGY' --r2 'LREDECEEWWSDYYDFGKQLPCAKSR' --chain 'HC' \


