#!/bin/bash

#bash cluster-data.sh "antiGD2_lineage/apo/mature/Ab3F8_mature_VC" "apo/Ab3F8_mature_VC" "1" "119" "1" "101" 
#bash cluster-data-replicate.sh "antiGD2_lineage/apo/mature/Ab3F8_mature_VC" "apo/Ab3F8_replicate1_mature_VC" "1" "119" "1" "101"
#bash cluster-data.sh "antiGD2_lineage/apo/intermediate/Ab3F8_I56S_VC" "apo/Ab3F8_I56S_VC" "1" "119" "1" "101"

python parse_and_save_avg_data_for_any_regions.py \
	--name "Ab3F8_naive_VC" \
	--hc_start 1 --hc_end 119 \
	--lc_start 1 --lc_end 101 \
	--r1 'DYS' --chain 'LC'\

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab3F8_I56S_VC" \
        --hc_start 1 --hc_end 119 \
        --lc_start 1 --lc_end 101 \
        --r1 'DYS' --chain 'LC'\

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab3F8_mature_VC" \
        --hc_start 1 --hc_end 119 \
        --lc_start 1 --lc_end 101 \
        --r1 'DYS' --chain 'LC' \

