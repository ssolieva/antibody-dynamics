#!/bin/bash

#SBATCH --job-name=clusterRMSD
#SBATCH --output=logs/cluster-cpu-log-%J.out
#SBATCH --partition=amdcpu
#SBATCH --time=02:00:00
#SBATCH --ntasks=128

# bash cluster-data.sh "simulation-path" "output-path" "start of VH" "end of VH" "start of VL" "end of VL"
# VH = variable heavy chain
# VL = variable light chain

# ------------------
# |naive background|
# ------------------
### bash cluster-data.sh "CH103_lineage/apo/naive/naive_V" "apo/CH103_naive_V" "1" "121" "1" "108"
### bash cluster-data.sh "CH103_lineage/apo/naive/naive_VC" "apo/CH103_naive_VC" "1" "121" "1" "108"

# -------------------
# |mature background|
# -------------------
### bash cluster-data.sh "CH103_lineage/apo/mature/mature_V" "apo/CH103_mature_V" "1" "121" "1" "105"
### bash cluster-data.sh "CH103_lineage/apo/mature/mature_VC" "apo/CH103_mature_VC" "1" "121" "1" "105"

# --------------------
# |Int. I2 background|
# --------------------
### bash cluster-data.sh "CH103_lineage/apo/intermediate/I2_V" "apo/CH103_I2_V" "1" "121" "1" "108"
### bash cluster-data.sh "CH103_lineage/apo/intermediate/I2_VC" "apo/CH103_I2_VC" "1" "121" "1" "108"

# ---------------------
# |Int. I32 background|
# ---------------------
### bash cluster-data.sh "CH103_lineage/apo/intermediate/I32_V" "apo/CH103_I32_V" "1" "121" "2" "108"
### bash cluster-data.sh "CH103_lineage/apo/intermediate/I32_VC" "apo/CH103_I32_VC" "1" "121" "2" "108"
