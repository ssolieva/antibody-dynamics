# 20260505 Shahlo Solieva

# Add in arguments
import argparse, os

parser = argparse.ArgumentParser(
    prog='calcRMSF',
    description='Calculate RMSF values.')

parser.add_argument('--name', type=str, required=True)
parser.add_argument('--hc_start', type=int, required=True)
parser.add_argument('--hc_end',   type=int, required=True)
parser.add_argument('--lc_start', type=int, required=True)
parser.add_argument('--lc_end', type=int, required=True)
parser.add_argument('--r1', type=str, required=True)
parser.add_argument('--r2', type=str, required=False)
parser.add_argument('--r3', type=str, required=False)
parser.add_argument('--r4', type=str, required=False)
parser.add_argument('--r5', type=str, required=False)
parser.add_argument('--r6', type=str, required=False)
parser.add_argument('--chain', type=str, required=True) 
args = parser.parse_args()

Ab_ranges = (
    args.name,
    args.hc_start,
    args.hc_end,
    args.lc_start,
    args.lc_end)

chain=args.chain # either HC or LC
R1 = args.r1
R2 = args.r2
R3 = args.r3
R4 = args.r4
R5 = args.r5
R6 = args.r6

all_R = [r for r in [R1, R2, R3, R4, R5, R6] if r is not None]


import numpy as np
import pandas as pd
import mdtraj as md

# Set paths.
BASE_PATH    = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/RMSF"
CLUSTER_BASE = "/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data"

# Helper functions:
def get_residues(sys_path, vh_start, vh_end, vl_start, vl_end):
    """
    Return heavy and light chain residue names from variable regions.
    """
    pdb_path = f"{CLUSTER_BASE}/{sys_path}/prot_masses.pdb"
    pdb = md.load(pdb_path)
    ca_atoms = pdb.topology.select(
        f'chainid 0 and residue {vh_start} to {vh_end} and name CA '
        f'or chainid 1 and residue {vl_start} to {vl_end} and name CA')
    residues = [pdb.topology.atom(i).residue for i in ca_atoms]
    hc_residues = residues[:vh_end]
    lc_residues = residues[vh_end:]
    return hc_residues, lc_residues

def load_and_split_rmsd(system_name, vh_end):
    """
    Load RMSD for given system, split into hc and lc data.
    """
    DATA_PATH = f"{BASE_PATH}/data/apo/{system_name}/VHC_VLC_CA_RMSF.npy"
    rmsd = np.load(DATA_PATH, allow_pickle=True)*10
    hc = rmsd[:vh_end]
    lc = rmsd[vh_end:]
    return hc, lc

def calculate_95CI_and_split(system_name, vh_end):
    """
    Load bootstrapped (n=1000) RMSD for given system, split into hc and lc data.
    """
    DATA_PATH = f"{BASE_PATH}/data/apo/{system_name}/n1000_bootstraps_VHC_VLC_CA_RMSF_avgs.npy"
    rmsds_all_average = np.load(DATA_PATH)*10
    ci_low  = np.percentile(rmsds_all_average, 2.5,  axis=0)
    ci_high = np.percentile(rmsds_all_average, 97.5, axis=0)
    ci_hc   = [ci_low[:vh_end], ci_high[:vh_end]]  # ci low for HC, ci high for HC
    ci_lc   = [ci_low[vh_end:], ci_high[vh_end:]]
    return ci_hc, ci_lc

def translate_resname_to_rescode(system_name, vh_start, vh_end, vl_start, vl_end):
    hc_resi, lc_resi = get_residues(f"apo/{system_name}", vh_start, vh_end, vl_start, vl_end)
    resname_to_rescode_definition =[[
        'ALA','ARG','ASN','ASP','CYS','GLU','GLN',\
        'GLY','HIS','ILE','LEU','LYS','MET','PHE',\
        'PRO','SER','THR','TRP','TYR','VAL'],\
        ['A'  ,'R'  ,'N'  ,'D'  ,'C'  ,'E'  ,'Q'  ,\
        'G'  ,'H'  ,'I'  ,'L'  ,'K'  ,'M'  ,'F'  ,\
        'P'  ,'S'  ,'T'  ,'W'  ,'Y'  ,'V' ]]
    single_code_resi_list = []
    for resi_list in [hc_resi, lc_resi]:
        single_code_resi_list_ = []
        for i in range(len(resi_list)):
            resname = str(resi_list[i])[0:3]
            res_number = str(resi_list[i])[3:]
            for j in range(len(resname_to_rescode_definition[0])):
                if resname == resname_to_rescode_definition[0][j]:
                    single_code_resi_list_.append(f'{resname_to_rescode_definition[1][j]}')
        single_code_resi_list.append(single_code_resi_list_)
    return ''.join(single_code_resi_list[0]), ''.join(single_code_resi_list[1])

def parse_by_seq(Ab_ranges, chain, query_seq):
    hc_rmsd, lc_rmsd =    load_and_split_rmsd(Ab_ranges[0], Ab_ranges[2])
    hc_ci,   lc_ci = calculate_95CI_and_split(Ab_ranges[0], Ab_ranges[2])
    hc_resi, lc_resi = translate_resname_to_rescode(*Ab_ranges)
    if chain == 'HC':
        if query_seq in hc_resi:
            #print(query_seq)
            index_start=(hc_resi.find(query_seq))
            index_end  = index_start + len(query_seq)
            print('index, seq:', index_start, index_end, '|', hc_resi[index_start:index_end])
            if query_seq == hc_resi[index_start:index_end]:
                return query_seq, hc_rmsd[index_start:index_end], hc_ci[0][index_start:index_end], hc_ci[1][index_start:index_end]
    if chain == 'LC':
        if query_seq in lc_resi:
            #print(query_seq)
            index_start=(lc_resi.find(query_seq))
            index_end  = index_start + len(query_seq)
            #print(lc_resi[index_start:index_end])
            print('index, seq:', index_start, index_end, '|', lc_resi[index_start:index_end])
            if query_seq == lc_resi[index_start:index_end]:
                return query_seq, lc_rmsd[index_start:index_end], lc_ci[0][index_start:index_end], lc_ci[1][index_start:index_end]

# run code:  
all_seq, all_rmsd, all_CI_low, all_CI_high = [],[],[],[]
for query_seq in all_R:
    if chain == 'HC':
        seq, rmsd, CI_low, CI_high = parse_by_seq(Ab_ranges, 'HC', query_seq)
        all_seq.append(seq)
        all_rmsd.append(np.average(rmsd))
        all_CI_low.append(np.average(CI_low))
        all_CI_high.append(np.average(CI_high))
        print(np.average(rmsd), np.average(CI_low), np.average(CI_high))
    if chain == 'LC':
        seq, rmsd, CI_low, CI_high = parse_by_seq(Ab_ranges, 'LC', query_seq)
        all_seq.append(seq)
        all_rmsd.append(np.average(rmsd))
        all_CI_low.append(np.average(CI_low))
        all_CI_high.append(np.average(CI_high))
        print(np.average(rmsd), np.average(CI_low), np.average(CI_high))


data = {}

for i in range(len(all_seq)):
    key = f'R{i+1}'
    data[key] = [
        all_seq[i],
        all_rmsd[i],
        all_CI_low[i],
        all_CI_high[i]]

df = pd.DataFrame(data)
df.to_csv(f'{BASE_PATH}/data/apo/{Ab_ranges[0]}/parsed_avg_{chain}_region_data.csv', index=False)


