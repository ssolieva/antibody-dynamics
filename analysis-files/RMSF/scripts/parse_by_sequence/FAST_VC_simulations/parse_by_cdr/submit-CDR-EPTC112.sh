#!/bin/bash


python parse_and_save_avg_data_for_cdr_loops.py \
	--name "EPTC112_naive_VC" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 110 \
	--cdrh1 'GGSVSSYY' --cdrh2 'IYYSGST' --cdrh3 'ARGYSSGWYAEYFQH' \
	--cdrl1 'SSDVGGYNY' --cdrl2 'EVS' --cdrl3 'SSYAGSNNFV' 

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "EPTC112_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 110 \
        --cdrh1 'NSRVSGYY' --cdrh2 'THFSLRP' --cdrh3 'ARGDASGWRADYFPH' \
        --cdrl1 'SSDIGASDY' --cdrl2 'DVT' --cdrl3 'SSDAGRHTLL'

