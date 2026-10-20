#!/bin/bash

### bash cluster-data.sh "CH103_lineage/apo/naive/naive_VC" "apo/CH103_naive_VC" "1" "121" "1" "108" 

### bash cluster-data.sh "CH103_lineage/apo/mature/mature_VC" "apo/CH103_mature_VC" "1" "121" "1" "105"

### bash cluster-data.sh "CH103_lineage/apo/intermediate/I2_V" "apo/CH103_I2_V" "1" "121" "1" "108" 

### bash cluster-data.sh "CH103_lineage/apo/intermediate/I32_V" "apo/CH103_I32_V" "1" "121" "2" "108" 

python parse_and_save_avg_data_for_cdr_loops.py \
	--name "CH103_naive_VC" \
	--hc_start 1 --hc_end 121 \
	--lc_start 1 --lc_end 108 \
	--cdrh1 'GGSISSYY' --cdrh2 'IYYSGST' --cdrh3 'ASLPRGQLVNAYFDY' \
	--cdrl1 'KLGDKY' --cdrl2 'QDS' --cdrl3 'QAWDSFSTFV' 

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH103_I32_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 2 --lc_end 108 \
        --cdrh1 'GGSMGGYY' --cdrh2 'IFHTGHT' --cdrh3 'ASLPRGQLVNAFFDN' \
        --cdrl1 'KLGDKY' --cdrl2 'QDS' --cdrl3 'QAWDSFSTFV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH103_I2_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'GGSMGGTY' --cdrh2 'IFHTGHT' --cdrh3 'ASLPRGQLVNAYFRN' \
        --cdrl1 'KVASKN' --cdrl2 'ENY' --cdrl3 'QVWDSFSTFV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CH103_mature_VC" \
        --hc_start 1 --hc_end 121 \
        --lc_start 1 --lc_end 105 \
        --cdrh1 'GGSMGGTY' --cdrh2 'IFHTGET' --cdrh3 'ASLPRGQLVNAYFRN' \
        --cdrl1 'STNV' --cdrl2 'ENY' --cdrl3 'QVWDSFSTFV'

