#!/bin/bash
#SBATCH --job-name=bootRMSD
#SBATCH --output=logs/FAH-bootstraps-%J.out
#SBATCH --partition=all
#SBATCH --time=1:00:00
#SBATCH --ntasks=128

# ------------------
# | Ab118 |
# ------------------
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/Ab118_naive_VC" "1" "125" "1" "108"
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/Ab118_mature_VC" "1" "131" "1" "108"


# ------------------
# | CAP256 |
# ------------------
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CAP256_naive_VC" "1" "144" "1" "111"
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CAP256_mature_VC" "1" "145" "1" "111"


# ------------------
# | CH103 |
# ------------------
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CH103_naive_VC" "1" "121" "1" "108"
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CH103_mature_VC" "1" "121" "1" "105"

# ------------------
# | CH65 |
# ------------------
### python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CH65_naive_VC" "1" "126" "1" "108"
### python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/CH65_mature_VC" "1" "126" "1" "108"

# ------------------
# | PGT121 |
# ------------------
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/PGT121_naive_VC" "1" "132" "1" "109"
#python FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py "apo/PGT121_mature_VC" "1" "132" "1" "105"

