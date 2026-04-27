#!/bin/bash

#SBATCH --job-name=boots
#SBATCH --output=bootstrap-n1000-log-%J.out
#SBATCH --partition=amdcpu
#SBATCH --time=200:00:00
#SBATCH -N 1
#SBATCH -n 128         

export OMP_NUM_THREADS=$SLURM_NTASKS
export NUMEXPR_MAX_THREADS=$SLURM_NTASKS

python /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/simulations/msm_scripts/bootstrap_MSMs_withReplacement_lagtime100_n1000.py
