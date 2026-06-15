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

# import packages + functions
import numpy as np
import mdtraj as md
import pickle
from Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure_toolbox import calculate_Ab_CA_RMSD_per_resi_to_start_structure
from Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure_toolbox import calculate_Ab_CA_RMSD_per_resi_to_average_structure

# assign input arguments
sys_path = args.path
start_of_VH = args.start_of_VH
end_of_VH = args.end_of_VH
start_of_VL = args.start_of_VL
end_of_VL = args.end_of_VL

# define path for clustered data, print out args. 
cluster_dir_path = f"/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/{sys_path}/"
print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

# calculate RMSF 
start_rmsds_all_average, start_variable_resi_names = calculate_Ab_CA_RMSD_per_resi_to_start_structure(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL)
avg_rmsds_all_average,   avg_variable_resi_names   = calculate_Ab_CA_RMSD_per_resi_to_average_structure(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL)

# define path for output
output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/per_resi_RMSD/data/{sys_path}/'

# save values as numpy files
np.save(f'{output_path}VHC_VLC_CA_RMSD_per_resi_to_start_structure.npy', start_rmsds_all_average)
np.save(f'{output_path}VHC_VLC_CA_RMSD_per_resi_to_start_structure_resis_list.npy', start_variable_resi_names)
np.save(f'{output_path}VHC_VLC_CA_RMSD_per_resi_to_average_structure.npy', avg_rmsds_all_average)
np.save(f'{output_path}VHC_VLC_CA_RMSD_per_resi_to_average_structure_resis_list.npy', avg_variable_resi_names)
