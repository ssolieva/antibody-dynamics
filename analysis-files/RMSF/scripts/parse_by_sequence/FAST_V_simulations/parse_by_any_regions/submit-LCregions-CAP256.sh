#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "CAP256_naive_V" \
	--hc_start 1 --hc_end 144 \
	--lc_start 1 --lc_end 111 \
	--r1 'ENNK' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I01_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'KNDN' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I03_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'ENNK' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_I04_V" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --r1 'ETNK' --chain 'LC' \


python parse_and_save_avg_data_for_any_regions.py \
        --name "CAP256_mature_V" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --r1 'ETDK' --chain 'LC' \


