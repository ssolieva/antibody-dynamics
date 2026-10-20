#!/bin/bash


python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_I07_VC" \
        --hc_start 1 --hc_end 111 \
        --lc_start 1 --lc_end 144 \
        --cdrh1 'GSNIGNNF' --cdrh2 'ESN' --cdrh3 'ATWAARLNSARV' \
        --cdrl1 'QFSFNRYG' --cdrl2 'ISFDGTDR' --cdrl3 'AKDLREDECEEWWSDYYDFGKKLPCRKSRGVAGVFDK'


python parse_and_save_avg_data_for_cdr_loops.py \
        --name "CAP256_I10_VC" \
        --hc_start 1 --hc_end 111 \
        --lc_start 1 --lc_end 144 \
        --cdrh1 'SSNIGDNY' --cdrh2 'ENT' --cdrh3 'GTWDVRPNRGAV' \
        --cdrl1 'QFTFSGHG' --cdrl2 'ISFAGTKM' --cdrl3 'AKDMREYECEYWTSDYYDFGRPQPCIDRRGVVGIFDM'
