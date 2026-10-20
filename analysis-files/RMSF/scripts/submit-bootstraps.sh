#!/bin/bash
#SBATCH --job-name=bootRMSF
#SBATCH --output=logs/withReplacement_n1000_boots_RMSF-%J.out
#SBATCH --partition=all#amdcpu
#SBATCH --time=1:00:00
####SBATCH --ntasks=128

runScript=bootstraps_CaRMSF_perResi_VHC_VLC_variable_lag.py
#runScript=bootstraps_CaRMSF_perResi_VHC_VLC_variable_cluster_radius.py

# CAP256
sys_path="apo/CAP256_naive_VC"
#sys_path="apo/CAP256_I01_VC"
#sys_path="apo/CAP256_I03_VC"
#sys_path="apo/CAP256_I04_VC"
#sys_path="apo/CAP256_naive_V"
#sys_path="apo/CAP256_I01_V"
#sys_path="apo/CAP256_I03_V"
#sys_path="apo/CAP256_I04_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "144" "1" "111"
python $runScript $sys_path "1" "144" "1" "111"

#sys_path="apo/CAP256_I10_VC"
#sys_path="apo/CAP256_I07_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "111" "1" "144"

sys_path="apo/CAP256_mature_VC"
#sys_path="apo/CAP256_mature_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "145" "1" "111"
python $runScript $sys_path "1" "145" "1" "111"

#CH65
sys_path="apo/CH65_naive_VC"
python $runScript $sys_path "1" "126" "1" "108"
sys_path="apo/CH65_mature_VC"
python $runScript $sys_path "1" "126" "1" "108"
#sys_path="apo/CH67_mature_VC"
#sys_path="apo/CH65_I2_VC"
#sys_path="apo/CH65_naive_V"
#sys_path="apo/CH65_mature_V"
#sys_path="apo/CH65_I2_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "126" "1" "108"

# EPTC112 
sys_path="apo/EPTC112_naive_VC"
python $runScript $sys_path "1" "121" "1" "110"
sys_path="apo/EPTC112_mature_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "121" "1" "110"
python $runScript $sys_path "1" "121" "1" "110"

# Ab3F8
sys_path="apo/Ab3F8_naive_VC"
python $runScript $sys_path "1" "119" "1" "101"
sys_path="apo/Ab3F8_mature_VC"
python $runScript $sys_path "1" "119" "1" "101"
#sys_path="apo/Ab3F8_I56S_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "119" "1" "101"

# CH103
sys_path="apo/CH103_naive_VC"
#sys_path="apo/CH103_naive_V"
#sys_path="apo/CH103_I2_VC"
#sys_path="apo/CH103_I2_V"
python $runScript $sys_path "1" "121" "1" "108"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "121" "1" "108"
sys_path="apo/CH103_mature_VC"
python $runScript $sys_path "1" "121" "1" "105"
#sys_path="apo/CH103_mature_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "121" "1" "105"
#sys_path="apo/CH103_I32_VC"
#sys_path="apo/CH103_I32_V"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "121" "2" "108"

# Ab118
sys_path="apo/Ab118_naive_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "125" "1" "108"
python $runScript $sys_path "1" "125" "1" "108"
sys_path="apo/Ab118_mature_VC"
#sys_path="apo/Ab118_IAb0923_VC"
#sys_path="apo/Ab118_IAb2748_VC"
#sys_path="apo/Ab118_I_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "131" "1" "108"
python $runScript $sys_path "1" "131" "1" "108"

# PGT121
sys_path="apo/PGT121_naive_kappa_VC"
python $runScript $sys_path "1" "132" "1" "109"
#sys_path="apo/PGT121_naive_lambda_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "132" "1" "109"
sys_path="apo/PGT121_mature_kappa_VC"
python $runScript $sys_path "1" "132" "1" "105"
#sys_path="apo/PGT121_mature_lambda_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "132" "1" "105"
#sys_path="apo/PGT121_3H3L_VC" 
#sys_path="apo/PGT121_32H3L_VC"
#sys_path="apo/PGT121_9H3L_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "132" "1" "112"
#sys_path="apo/PGT124_mature_VC"
#python bootstraps_CaRMSF_perResi_VHC_VLC.py $sys_path "1" "132" "1" "108"
