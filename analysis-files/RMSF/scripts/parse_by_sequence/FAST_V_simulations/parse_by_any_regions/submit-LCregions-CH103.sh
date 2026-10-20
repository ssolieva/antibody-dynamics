#!/bin/bash

python parse_and_save_avg_data_for_any_regions.py \
	--name "CH103_naive_V" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 108 \
	--r1 'LGD' --r2 'QDSK' --r3 'SNS' --r4 'WDSF' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_I32_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 2 --lc_end 108 \
	--r1 'LGD' --r2 'QDSK' --r3 'SNS' --r4 'WDSF' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_I2_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 108 \
	--r1 'VAS' --r2 'ENYK' --r3 'SKS' --r4 'WDSF' --chain 'LC' \

python parse_and_save_avg_data_for_any_regions.py \
        --name "CH103_mature_V" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 105 \
	--r1 'TN' --r2 'ENYK' --r3 'SKS' --r4 'WDSF' --chain 'LC' \



