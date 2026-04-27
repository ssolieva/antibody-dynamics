#!/bin/bash
# created 11-13-2025, Shahlo Solieva
# Use enspara to cluster simulation data based on the variable region (backbone + CB) atoms.
# Then, use enspara to build a markov state model
# 
# Summary of parameters:
# 	- algorithm = khybrid 
# 	- atoms = backbone and CB atoms from the variable heavy chain + variable light chain 
# 	- cluster radius = 0.15 nm (stop clustering once this radius is reached)

sys_path=$1 		# example: "CH103_lineage/apo/naive/naive_V"
output_dir_path=$2 	# example: "apo/CH103_naive_V"
start_of_VH=$3 		# example: "1"
end_of_VH=$4 		# example: "121"
start_of_VL=$5 		# example: "1"
end_of_VL=$6 		# example: "108"

# Check that the simulation directory exists 
base_path="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/simulations/$sys_path"
if [ -d "$base_path" ]; then
	echo "$base_path exists!"
else
	echo "$base_path does not exist. Check path."
fi

# Create output directory if one does not exist already
out_dir="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/$output_dir_path"
if [ -d "$out_dir" ]; then
        echo "$out_dir exists!"
else
        echo "$out_dir does not exist. Creating directory now..."
	mkdir $out_dir
fi

# Copy prot_masses structure file into the output directory 
cp $base_path/FAST_RMSD/msm/prot_masses.pdb $out_dir
pwd

# CLUSTER SIMULATION FRAMES
echo "Starting Clustering ..."
python -u /export/home/WG-shahlo/software/enspara/enspara/apps/cluster.py \
			--trajectories "$base_path/FAST_RMSD/msm/trajectories/*.xtc" \
			--topology "$out_dir/prot_masses.pdb" \
			--algorithm khybrid \
			--atoms 'chainid 0 and residue '$start_of_VH' to '$end_of_VH' and name N CA CB C O or chainid 1 and residue '$start_of_VL' to '$end_of_VL' and name N CA CB C O' \
			--cluster-radius 0.15 \
		        --cluster-distance rmsd \
			--distances $out_dir/cluster-distances.h5 \
			--center-features $out_dir/cluster-centers.pickle \
			--assignments $out_dir/cluster-assignments.h5


# BUILD MSM
echo "Clustering is finished"
echo "Building MSM based on cluster centers ..."
echo "> Entering $out_dir"
cd $out_dir
pwd
cp /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/make-msms.slurm .
sbatch make-msms.slurm
echo "make-msms.slurm submitted!"
cd -
pwd

