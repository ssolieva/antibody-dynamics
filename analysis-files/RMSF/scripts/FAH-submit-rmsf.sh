#!/bin/bash
#SBATCH --job-name=RMSF
#SBATCH --output=logs/RMSF-%J.out
#SBATCH --partition=all #amdcpu
#SBATCH --time=2:00:00
######SBATCH --ntasks=128

# check if sys_path exists and make dir if not.
#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

# ------------------
# |     PGT121     |
# ------------------
###python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/PGT121_naive_VC" "1" "132" "1" "109"
python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/PGT121_mature_VC" "1" "132" "1" "105"

# ------------------
# |     CH65       |
# ------------------
###python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CH65_naive_VC" "1" "126" "1" "108"
###python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CH65_mature_VC" "1" "126" "1" "108"

# ------------------
# |     CH103      |
# ------------------
#python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CH103_naive_VC" "1" "121" "1" "108"
### python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CH103_mature_VC" "1" "121" "1" "105" 

# ------------------
# |    CAP256      |
# ------------------
#python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CAP256_naive_VC" "1" "144" "1" "111"
### python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/CAP256_mature_VC" "1" "145" "1" "111"

# ------------------
# |      1-18      |
# ------------------
###python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/Ab118_naive_VC" "1" "125" "1" "108" 
#python FAH-Ab_CA_RMSF_VHC_VLC.py "apo/Ab118_mature_VC" "1" "131" "1" "108"

