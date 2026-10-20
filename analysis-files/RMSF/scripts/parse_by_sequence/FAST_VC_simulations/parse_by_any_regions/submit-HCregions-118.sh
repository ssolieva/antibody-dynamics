#!/bin/bash


python parse_and_save_avg_data_for_any_regions.py \
	--name "Ab118_naive_VC" \
	--hc_start 1 --hc_end 125 \
	--lc_start 1 --lc_end 108 \
	--r1 'KVSCKASGYTFTSYY' --r2 'PSGGSTSYAQKFQ' --r3 'MTRDTSTSTVYME' --r4 'FGERAPYYYY' --chain 'HC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_I_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --r1 'KVSCRADDDPYTDDDTFTKYW' --r2 'PHFARPIYSYKFRGR' --r3 'MTRDTSLTTVYMEL' --r4 'FGDRAPHYNY' --chain 'HC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_IAb2748_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --r1 'KVSCRADDDPYTDDDTFTKYW' --r2 'PHFARPIYSYKFRDR' --r3 'MTRDTSLTAVYMEL' --r4 'FGDRAPHYNY' --chain 'HC' 

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_IAb0923_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --r1 'RISCRADDDPYTDDDTFTKYY' --r2 'PHFARPIYSYKFQDR' --r3 'LTRDSSLTAVYLEL' --r4 'FGERAPHYNY' --chain 'HC'  

python parse_and_save_avg_data_for_any_regions.py \
        --name "Ab118_mature_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --r1 'RISCRADDDPYTDDDTFTKYW' --r2 'PHFARPIYSYKFRDR' --r3 'LTRDSSLTAVYLEL' --r4 'FGDRAPHYNY' --chain 'HC' 






