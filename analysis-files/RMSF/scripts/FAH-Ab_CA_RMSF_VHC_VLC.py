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

import numpy as np
import mdtraj as md
import pickle
from FAH_Ab_CA_RMSF_VHC_VLC_toolbox import calculate_Ab_CA_RMSF

sys_path = args.path
start_of_VH = args.start_of_VH
end_of_VH = args.end_of_VH
start_of_VL = args.start_of_VL
end_of_VL = args.end_of_VL

radius="radius_15_variable_subsample50_updated"
#radius="radius_15_variable_subsample50" # Just for CH103 mature

radius_name= f"/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/clustering/{radius}"
cluster_dir_path = f"{radius_name}/data/{sys_path}/"
print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

avg_rmsds_all_average,   avg_variable_resi_names   = calculate_Ab_CA_RMSF(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL,  radius_name)

output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF/data/{sys_path}/'
#output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF/data/apo/PGT121_naive_lambda_VC/'
#output_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/RMSF/data/apo/PGT121_mature_lambda_VC/'
np.save(f'{output_path}VHC_VLC_CA_RMSF.npy', avg_rmsds_all_average)
np.save(f'{output_path}VHC_VLC_CA_RMSF_resis_list.npy', avg_variable_resi_names)

