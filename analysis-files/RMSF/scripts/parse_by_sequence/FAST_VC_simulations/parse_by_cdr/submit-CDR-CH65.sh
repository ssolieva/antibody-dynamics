#!/bin/bash

### bash cluster-data.sh "CH65_CH67_lineage/apo/naive/naive_VC" "apo/CH65_naive_VC" "1" "126" "1" "108"
# bash cluster-data.sh "CH65_CH67_lineage/apo/mature/mature_CH65_VC" "apo/CH65_mature_VC" "1" "126" "1" "108" 
#bash cluster-data.sh "CH65_CH67_lineage/apo/mature/mature_CH67_VC" "apo/CH67_mature_VC" "1" "126" "1" "108"
### bash cluster-data.sh "CH65_CH67_lineage/apo/intermediate/I2_VC" "apo/CH65_I2_VC" "1" "126" "1" "108"

python parse_and_save_avg_data_for_cdr_loops.py \
	--name "CH65_naive_VC" \
	--hc_start 1 --hc_end 126 \
	--lc_start 1 --lc_end 108 \
	--cdrh1 'GYTFTGYY' --cdrh2 'INPNSGGT' --cdrh3 'ARGGLEPRSVDYYYYGMDV' \
	--cdrl1 'NIGSKS' --cdrl2 'DDS'  --cdrl3 'QVWDSSSDHVV' 

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH65_I2_VC" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'GYTFTDYY' --cdrh2 'IHPNSGGT' --cdrh3 'ARGGLEPRSVDYYYYGMDV' \
        --cdrl1 'NIGSKS' --cdrl2 'DDS'  --cdrl3 'QVWDSSSDHVV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH65_mature_VC" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'GYTFTDYH' --cdrh2 'IHPNSGDT' --cdrh3 'ARGGLEPRSVDYYYYGMDV' \
        --cdrl1 'DIGRKS' --cdrl2 'YDS'  --cdrl3 'QVWDSSSDHVI'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH67_mature_VC" \
        --hc_start 1 --hc_end 126 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'GYTFTDNY' --cdrh2 'IHPNSGAT' --cdrh3 'ARAGLEPRSVDYYFYGLDV' \
        --cdrl1 'NIGRKR' --cdrl2 'EDS'  --cdrl3 'QVWDSDSDHVV'






