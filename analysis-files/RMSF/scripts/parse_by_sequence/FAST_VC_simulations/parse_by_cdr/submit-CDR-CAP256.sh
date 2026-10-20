#!/bin/bash

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_naive_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --cdrh1 'GFTFSSYG' --cdrh2 'ISYDGSNK' --cdrh3 'AKDLGESENEEWATDYYDFSIGYPGQDPRGVVGAFDI' \
        --cdrl1 'SSNIGNNY' --cdrl2 'ENN' --cdrl3 'GTWDSSLSAGGV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_I01_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --cdrh1 'GFTFSNFA' --cdrh2 'ISSDGSNK' --cdrh3 'AKDVGDYKSDEWGTEYYDISISYPIQDPRAMVGAFDL' \
        --cdrl1 'SSTIGNNY' --cdrl2 'KND' --cdrl3 'GTWDTSLSGGGV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_I03_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --cdrh1 'RFSFNRYG' --cdrh2 'ISYDGTDK' --cdrh3 'AKDLREDECEEWWSDYYDFGKQLPCRKSRGVAGIFDG' \
        --cdrl1 'SSNIGNNF' --cdrl2 'ENN' --cdrl3 'ATWSASLSSARV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_I04_VC" \
        --hc_start 1 --hc_end 144 \
        --lc_start 1 --lc_end 111 \
        --cdrh1 'QFSFNRYG' --cdrh2 'ISYDGTDK' --cdrh3 'AKDLREDECEEWWSDYYDFGKQLPCRKSRGVAGIFDK' \
        --cdrl1 'SSNIGNNF' --cdrl2 'ETN' --cdrl3 'ATWAASLTSARV'

python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_mature_VC" \
        --hc_start 1 --hc_end 145 \
        --lc_start 1 --lc_end 111 \
        --cdrh1 'QFRFDGYG' --cdrh2 'ISHDGIKK' --cdrh3 'AKDLREDECEEWWSDYYDFGKQLPCAKSRGGLVGIADN' \
        --cdrl1 'TSNIGNNF' --cdrl2 'ETD' --cdrl3 'ATWAASLSSARV'
