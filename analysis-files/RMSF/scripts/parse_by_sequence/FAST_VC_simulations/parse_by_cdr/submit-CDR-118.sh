#!/bin/bash


python parse_and_save_avg_data_for_cdr_loops.py \
	--name "Ab118_naive_VC" \
	--hc_start 1 --hc_end 125 \
	--lc_start 1 --lc_end 108 \
	--cdrh1 'GYTFTSYY' --cdrh2 'INPSGGST' --cdrh3 'ARDPFGERAPYYYYYMDV' \
	--cdrl1 'QSVSSSY' --cdrl2 'GAS'  --cdrl3 'QQYGSSPLT' 

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "Ab118_I_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'DDPYTDDDTFTKYW' --cdrh2 'ISPHFARP' --cdrh3 'ARDPFGDRAPHYNYHMDV' \
        --cdrl1 'QGLSSSH' --cdrl2 'GTS'  --cdrl3 'QRYGSTPIT'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "Ab118_IAb2748_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'DDPYTDDDTFTKYW' --cdrh2 'ISPHFARP' --cdrh3 'ARDPFGDRAPHYNYHMDV' \
        --cdrl1 'QGLSSSH' --cdrl2 'GTS'  --cdrl3 'QRYGNTPIT'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "Ab118_IAb0923_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'DDPYTDDDTFTKYY' --cdrh2 'ISPHFARP' --cdrh3 'ARDPFGERAPHYNYHMDV' \
        --cdrl1 'EGLDSSQ' --cdrl2 'GVS'  --cdrl3 'QRFGATPIT'


python parse_and_save_avg_data_for_cdr_loops.py \
        --name "Ab118_mature_VC" \
        --hc_start 1 --hc_end 131 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'DDPYTDDDTFTKYW' --cdrh2 'ISPHFARP' --cdrh3 'ARDPFGDRAPHYNYHMDV' \
        --cdrl1 'QGLDSSH' --cdrl2 'GTS'  --cdrl3 'QRYGGTPIT'






