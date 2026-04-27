#!/bin/bash

# created 03-30-2026, Shahlo Solieva
# Bootstrap MSM by choosing 50 trajectories randomly with replacement per system 

data_dir_list="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/scripts/dir_list_bootstrap_n1000_select.txt"
for data_dir in $(cat "$data_dir_list"); do
    echo "$data_dir"
    data_dir_path="/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/apo/$data_dir/"
    cd $data_dir_path
    mkdir bootstrap_with_replacement
    cd bootstrap_with_replacement
    cp /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/simulations/msm_scripts/submit-bootstrap-lagtime100-n1000-CPU.sh .
    sleep 1s
    sbatch submit-bootstrap-lagtime100-n1000-CPU.sh
done

