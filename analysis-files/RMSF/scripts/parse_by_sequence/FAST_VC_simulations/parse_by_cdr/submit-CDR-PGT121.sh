#!/bin/bash


#sys_path="apo/PGT121_3H3L_VC" # 132, 112
#sys_path="apo/PGT121_32H3L_VC" # 132, 112
#sys_path="apo/PGT121_9H3L_VC" # 132, 112
#python Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py $sys_path "1" "132" "1" "109"
#python Ab_CA_RMSD_per_resi_VC_to_start_or_average_structure.py $sys_path "1" "132" "1" "109"

echo 0
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_naive_kappa_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 109 \
        --cdrh1 'GGSISSYY' --cdrh2 'IYYSGST' --cdrh3 'ARTQQGKRIYGVVSFGDYYYYYYMDV' \
        --cdrl1 'NIGSKS' --cdrl2 'DDS' --cdrl3 'QVWDSSSDHPWV'
echo 1
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_naive_lambda_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 109 \
        --cdrh1 'GGSISSYY' --cdrh2 'IYYSGST' --cdrh3 'ARTQQGKRIYGVVSFGDYYYYYYMDV' \
        --cdrl1 'NIGSKS' --cdrl2 'DDS' --cdrl3 'QVWDSSSDHPWV'

echo 2
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_mature_kappa_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 105 \
        --cdrh1 'GASISDSY' --cdrh2 'VHKSGDT' --cdrh3 'ARTLHGRRIYGIVAFNEWFTYFYMDV' \
        --cdrl1 'SLGSRA' --cdrl2 'NNQ' --cdrl3 'HIWDSRVPTKWV'

echo 3
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_mature_lambda_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 105 \
	--cdrh1 'GASISDSY' --cdrh2 'VHKSGDT' --cdrh3 'ARTLHGRRIYGIVAFNEWFTYFYMDV' \
        --cdrl1 'SLGSRA' --cdrl2 'NNQ' --cdrl3 'HIWDSRVPTKWV'
echo 4
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_3H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
        --cdrh1 'GGSISNYY' --cdrh2 'ISDSEST' --cdrh3 'ARAQQGKRIYGMVSFGEFFYYYYMDV' \
        --cdrl1 'SLGSRA' --cdrl2 'NNQ' --cdrl3 'HMWDSRSAINWV'
echo 5
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_32H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
        --cdrh1 'GGSISNYY' --cdrh2 'ISDRETT' --cdrh3 'ATARRGQRIYGVVSFGEFFYYYYMDV' \
        --cdrl1 'SLGSRA' --cdrl2 'NNQ' --cdrl3 'HMWDSRSAINWV'
echo 6
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT121_9H3L_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 112 \
        --cdrh1 'GASISDHY' --cdrh2 'VYDSGDT' --cdrh3 'ARTQHGRRIYGIVAFREWFTYFYMDV' \
        --cdrl1 'SLGSRA' --cdrl2 'NNQ' --cdrl3 'HMWDSRSAINWV'

echo 7
python parse_and_save_avg_data_for_cdr_loops.py \
        --name "PGT124_mature_VC" \
        --hc_start 1 --hc_end 132 \
        --lc_start 1 --lc_end 108 \
        --cdrh1 'GGSISNYY' --cdrh2 'ISDRETT' --cdrh3 'ATARRGQRIYGVVSFGEFFYYYYMDV' \
        --cdrl1 'ALGSRA' --cdrl2 'NNQ' --cdrl3 'HMWDSRSGFSWS'



