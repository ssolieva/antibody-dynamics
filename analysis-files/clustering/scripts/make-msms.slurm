#!/bin/sh
#SBATCH -n 10
#SBATCH --partition=amdcpu
#SBATCH -J msm
#SBATCH -e msm-%j.log
#SBATCH -o msm-%j.log
#SBATCH --mem=20G
#SBATCH -N 1
#SBATCH --time=10-0:00:00
export OMP_NUM_THREADS=$SLURM_NTASKS
export NUMEXPR_MAX_THREADS=$SLURM_NTASKS

python /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/simulations/msm_scripts/make_imp_tscale.py cluster-assignments.h5 .
python /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/simulations/msm_scripts/make_msm.py cluster-assignments.h5 . msm
