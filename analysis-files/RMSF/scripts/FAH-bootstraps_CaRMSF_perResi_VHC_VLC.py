# Updated on 07/01/2026

# --------------------------------------------------------------------
# Add in arguments 
import argparse, os
parser = argparse.ArgumentParser(prog='calcRMSD', description='Calculate RMSD values.')
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

# --------------------------------------------------------------------
# import packages
import numpy as np
import mdtraj as md
import pickle
from FAH_bootstraps_toolbox import calculate_Ab_CA_RMSF_bootstraps

# --------------------------------------------------------------------
# define arguments
sys_path = args.path
start_of_VH = args.start_of_VH
end_of_VH = args.end_of_VH
start_of_VL = args.start_of_VL
end_of_VL = args.end_of_VL

rad_path='radius_15_variable_subsample50_updated'
# --------------------------------------------------------------------
# define paths
FAH_BASE = '/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/'
cluster_dir_path = f"{FAH_BASE}clustering/{rad_path}/data/{sys_path}/"
#print(sys_path, cluster_dir_path)

# --------------------------------------------------------------------
# check inputs
#print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

# --------------------------------------------------------------------
# calculate RMSF
avg_rmsds_all_average, avg_variable_resi_names = calculate_Ab_CA_RMSF_bootstraps(cluster_dir_path, sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL)

# save RMSF, standard deviation, and residue list. 
output_path = f'{FAH_BASE}RMSF/data/{sys_path}/'
#output_path = f'{FAH_BASE}RMSF/data/apo/PGT121_naive_lambda_VC/'
#output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF/data/apo/PGT121_mature_lambda_VC/'
np.save(f'{output_path}n100_bootstraps_VHC_VLC_CA_RMSF_avgs.npy',       avg_rmsds_all_average)
np.save(f'{output_path}n100_bootstraps_VHC_VLC_CA_RMSF_resis_list.npy', avg_variable_resi_names)
