#!/bin/bash
#SBATCH --job-name=variableRMSF
#SBATCH --output=logs/variableRMSF-%J.out
#SBATCH --partition=all ##amdcpu ## all 
#SBATCH --time=01:00:00

#check if sys_path exists and make dir if not.
#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

# ------
# Ab118
# ------
#sys_path="apo/Ab118_naive_VC"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "125" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "125" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "125" "1" "108"

# mature and intermediates:
#sys_path="apo/Ab118_mature_VC"
#sys_path="apo/Ab118_IAb0923_VC"
#sys_path="apo/Ab118_IAb2748_VC"
#sys_path="apo/Ab118_I_VC"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "131" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "131" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "131" "1" "108"

# ------
# Ab3F8 
# ------
#sys_path="apo/Ab3F8_naive_VC"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "119" "1" "101"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "119" "1" "101"
#sys_path="apo/Ab3F8_mature_VC"
#sys_path="apo/Ab3F8_I56S_VC"
# naive or mature:
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "119" "1" "101"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "119" "1" "101"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "119" "1" "101"

# ------
# CH103
# ------
#sys_path="apo/CH103_naive_VC"
#sys_path="apo/CH103_naive_V"
#sys_path="apo/CH103_I2_VC"
#sys_path="apo/CH103_I2_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "121" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "121" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "121" "1" "108"

#sys_path="apo/CH103_mature_VC"
#sys_path="apo/CH103_mature_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "121" "1" "105"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "121" "1" "105"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "121" "1" "105"

#sys_path="apo/CH103_I32_VC"
#sys_path="apo/CH103_I32_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "121" "2" "108"

# ------
# CH65
# ------
#sys_path="apo/CH65_naive_VC"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "126" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "126" "1" "108"
#sys_path="apo/CH65_mature_VC"
#sys_path="apo/CH67_mature_VC"
#sys_path="apo/CH65_I2_VC"
#sys_path="apo/CH65_naive_V"
#sys_path="apo/CH65_mature_V"
#sys_path="apo/CH65_I2_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "126" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "126" "1" "108"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "126" "1" "108"

# ------
# PGT121
# ------
#sys_path="apo/PGT121_naive_kappa_VC"
#sys_path="apo/PGT121_naive_lambda_VC"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "132" "1" "109"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "132" "1" "109"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "132" "1" "109"

#sys_path="apo/PGT121_mature_kappa_VC"
#sys_path="apo/PGT121_mature_lambda_VC"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "132" "1" "105"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "132" "1" "105"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "132" "1" "105"

#sys_path="apo/PGT121_3H3L_VC" # 132, 112
#sys_path="apo/PGT121_32H3L_VC" # 132, 112
#sys_path="apo/PGT121_9H3L_VC" # 132, 112
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "132" "1" "112"

#sys_path="apo/PGT124_mature_VC"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "132" "1" "108"

# ------
# CAP256
# ------
# naive
#sys_path="apo/CAP256_I07_VC"
#sys_path="apo/CAP256_I07_V"
#sys_path="apo/CAP256_I10_VC"
#sys_path="apo/CAP256_I10_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "111" "1" "144"

#sys_path="apo/CAP256_naive_VC"
#sys_path="apo/CAP256_naive_V"
#sys_path="apo/CAP256_I01_VC" 
#sys_path="apo/CAP256_I01_V"
#sys_path="apo/CAP256_I03_VC"
#sys_path="apo/CAP256_I03_V"
#sys_path="apo/CAP256_I04_VC"
#sys_path="apo/CAP256_I04_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "144" "1" "111"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "144" "1" "111"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "144" "1" "111"

# mature
#sys_path="apo/CAP256_mature_VC"
#sys_path="apo/CAP256_mature_V"
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "145" "1" "111"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "145" "1" "111"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "145" "1" "111"

# -------
# EPTC112
# -------
#sys_path="apo/EPTC112_naive_VC"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "121" "1" "110"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "121" "1" "110"
#sys_path="apo/EPTC112_mature_VC"
# naive or mature:
#python Ab_CA_RMSF_VHC_VLC.py $sys_path "1" "121" "1" "110"
#python Ab_CA_RMSF_VHC_VLC_variable_lag.py $sys_path "1" "121" "1" "110"
#python Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py $sys_path "1" "121" "1" "110"
