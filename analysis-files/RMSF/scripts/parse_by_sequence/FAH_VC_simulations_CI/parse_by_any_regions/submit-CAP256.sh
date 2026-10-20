#!/bin/bash


#python parse_and_save_avg_data_for_any_regions.py \
#	--name "CAP256_naive_VC" \
#	--hc_start 1 --hc_end 144 \
#	--lc_start 1 --lc_end 111 \
#	--r1 'GFTFSSY' --r2 'LGESENEEWATDYYDFSIGYPGQDPR' --chain 'HC' \


python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_VC" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'QFRFDGY' --r2 'LREDECEEWWSDYYDFGKQLPCAKSR' --chain 'HC' \



#python parse_and_save_avg_data_for_any_regions.py \
#        --name "CAP256_naive_VC" \
#        --hc_start 1 --hc_end 144 \
#        --lc_start 1 --lc_end 111 \
#        --r1 'ENNK' --chain 'LC' \


python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_VC" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'ETDK' --chain 'LC' \

