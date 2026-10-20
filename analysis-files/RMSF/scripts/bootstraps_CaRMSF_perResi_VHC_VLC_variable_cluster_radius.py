# Add in arguments 
import argparse, os

parser = argparse.ArgumentParser(prog='calcRMSF', description='Calculate RMSF values.')
parser.add_argument('path',type=str,
                    help='Path to directory containing cluster centers and msm data')
parser.add_argument('start_of_VH',type=str,
                    help='Residue index for the start of the variable heavy chain')
parser.add_argument('end_of_VH',type=str,
                    help='Residue index for the end of the variable heavy chain')
parser.add_argument('start_of_VL',type=str,
                    help='Residue index for the start of the variable light chain')
parser.add_argument('end_of_VL',type=str,
                    help='Residue index for the end of the variable light chain')
args = parser.parse_args()

import numpy as np
import mdtraj as md
import pickle
from bootstraps_toolbox import calculate_Ab_CA_RMSF_bootstraps_variable_cluster_radius

# define arguments
sys_path = args.path
start_of_VH = args.start_of_VH
end_of_VH = args.end_of_VH
start_of_VL = args.start_of_VL
end_of_VL = args.end_of_VL

nrad = '18'
# define path 
cluster_dir_path = f"/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/sensitivity_analysis/radius_{nrad}_variable/data/{sys_path}/"
print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

# calculate RMSF
avg_rmsds_all_average,  avg_variable_resi_names = calculate_Ab_CA_RMSF_bootstraps_variable_cluster_radius(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL, nrad)

# save RMSF, residue list.  
output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF/data/{sys_path}/'
np.save(f'{output_path}n1000_bootstraps_VHC_VLC_CA_RMSF_avgs_radius{nrad}.npy',       avg_rmsds_all_average)
np.save(f'{output_path}n1000_bootstraps_VHC_VLC_CA_RMSF_resis_list_radius{nrad}.npy', avg_variable_resi_names)
