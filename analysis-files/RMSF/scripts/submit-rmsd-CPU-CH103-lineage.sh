#!/bin/bash
#SBATCH --job-name=variableRMSD
#SBATCH --output=logs/vcRMSD-%J.out
#SBATCH --partition=all #amdcpu
#SBATCH --time=02:00:00
#SBATCH --ntasks=128

# ------------------
# |naive background|
# ------------------
# define system path for input and output data
#sys_path="apo/CH103_naive_V"
#sys_path="apo/CH103_naive_VC"

#check if sys_path exists and make dir if not.
#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

#python Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py $sys_path "1" "121" "1" "108"
#python Ab_CA_RMSD_per_resi_VC_to_start_or_average_structure.py $sys_path "1" "121" "1" "108"

# -------------------
# |mature background|
# -------------------
#sys_path="apo/CH103_mature_V"
#sys_path="apo/CH103_mature_VC"

# check if sys_path exists and make dir if not.
#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

#python Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py $sys_path "1" "121" "1" "105"
#python Ab_CA_RMSD_per_resi_VC_to_start_or_average_structure.py $sys_path "1" "121" "1" "105"


# --------------------
# |Int. I2 background|
# --------------------
#sys_path="apo/CH103_I2_V"
#sys_path="apo/CH103_I2_VC"

#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

#python Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py $sys_path "1" "121" "1" "108"
#python Ab_CA_RMSD_per_resi_VC_to_start_or_average_structure.py $sys_path "1" "121" "1" "108"

# ---------------------
# |Int. I32 background|
# ---------------------
#sys_path="apo/CH103_I32_V"
#sys_path="apo/CH103_I32_VC"

#out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD/data/$sys_path/"
#if [ -d "$out_dir" ]; then
#        echo "$out_dir exists!"
#else
#        echo "$out_dir does not exist. Creating directory now..."
#        mkdir $out_dir
#fi

#python Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py $sys_path "1" "121" "2" "108"
#python Ab_CA_RMSD_per_resi_VC_to_start_or_average_structure.py $sys_path "1" "121" "2" "108"

