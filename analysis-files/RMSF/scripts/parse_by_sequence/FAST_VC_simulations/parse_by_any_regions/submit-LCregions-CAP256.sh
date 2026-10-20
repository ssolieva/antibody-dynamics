#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "CAP256_naive_VC" \
	--hc_start 1 --hc_end 144 \
	--lc_start 1 --lc_end 111 \
	--r1 'ENNK' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I01_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'KNDN' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I03_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'ENNK' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I04_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'ETNK' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I07_VC" \
        --hc_start 1 --hc_end 111 \
        --lc_start 1 --lc_end 144 \
        --r1 'ESNK' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I10_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'ENTR' --chain 'HC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_VC" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'ETDK' --chain 'LC' \


