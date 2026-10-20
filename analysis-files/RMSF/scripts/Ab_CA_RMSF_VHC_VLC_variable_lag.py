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
from Ab_CA_RMSF_VHC_VLC_toolbox import calculate_Ab_CA_RMSF_variable_lag

sys_path = args.path
start_of_VH = args.start_of_VH
end_of_VH = args.end_of_VH
start_of_VL = args.start_of_VL
end_of_VL = args.end_of_VL

#nlag = '300' # lag time (frames) 
nlag = '200' # lag time (frames)
cluster_dir_path = f"/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/{sys_path}/"
print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

avg_rmsfs_all_average,   avg_variable_resi_names   = calculate_Ab_CA_RMSF_variable_lag(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL, nlag)

# save data: 
output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF/data/{sys_path}/'
np.save(f'{output_path}VHC_VLC_CA_RMSF_lagtime{nlag}.npy', avg_rmsfs_all_average)
np.save(f'{output_path}VHC_VLC_CA_RMSF_resnames_lagtime{nlag}.npy', avg_variable_resi_names)

