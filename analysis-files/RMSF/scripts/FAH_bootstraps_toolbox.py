# Created 20260322, Shahlo Solieva. 
# Updated 20260408

import numpy as np
import mdtraj as md
import pickle

def calculate_Ab_CA_RMSF_bootstraps(cluster_dir_path, sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL):
    '''
    Heavy chain should be the first chain (Chain A or chainid 0)
    Light chain should be the second chain (Chain B or chainid 1)
    prot_masses_uniform.pdb = chainid and residue numbering may have 
       been altered to be uniform across all lineage members.
    Output RMSD values are in nm units.
    '''
    print("--------------------------------------------------------------")
    print("| Running calculate_Ab_CA_RMSF_bootstraps                    |")
    print("--------------------------------------------------------------")

    # -------------------------------------------------------------------- 
    # define inputs directory path and print out all input variables
    # FAH: /mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/clustering/radius_15_variable_subsample50.
    #cluster_dir_path = f"/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/FAH-analysis-20260212/clustering/radius_15_variable_subsample50/data/{sys_path}/"
    print("\tTOOLBOX INPUTS:", cluster_dir_path, '\n\t\t', \
            start_of_VH, end_of_VH, start_of_VL, end_of_VL)

    # --------------------------------------------------------------------
    # import pdb and select alpha carbons from the variable region:
    #pdb = md.load(f'{cluster_dir_path}prot_masses.pdb') #
    pdb= md.load(f'{cluster_dir_path}prot_masses_uniform.pdb')
    #pdb_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/{sys_path}/prot_masses.pdb'
    #pdb=md.load(pdb_path)
    all_ca_atoms = pdb.topology.select(
             f'chainid 0 and residue {start_of_VH} to {end_of_VH} and name CA or '
             f'chainid 1 and residue {start_of_VL} to {end_of_VL} and name CA')
    # check residue names. 
    # print(f'{cluster_dir_path}prot_masses.pdb')
    print(len(pdb.topology.select(f'chainid 0 and residue {start_of_VH} to {end_of_VH} and name CA')))
    print(len(pdb.topology.select(f'chainid 1 and residue {start_of_VL} to {end_of_VL} and name CA')))
    print(f"\tTOOLBOX INFO: number of CA atoms in variable region: {len(all_ca_atoms)}")
    variable_resi_names = [pdb.topology.atom(a).residue for a in all_ca_atoms]
    print(f"\tTOOLBOX INFO: number of residues in variable region: {len(variable_resi_names)}")
    # --------------------------------------------------------------------
    # load in the cluster centers from the clustering step.
    if 'CAP256' not in cluster_dir_path:
        file=f"{cluster_dir_path}cluster-centers.pickle"
        with open(f"{cluster_dir_path}cluster-centers.pickle", 'rb') as file:
            centers=pickle.load(file)
    if 'CAP256' in cluster_dir_path:
        file=f"{cluster_dir_path}cluster-centers-r215.pickle"
        with open(f"{cluster_dir_path}cluster-centers-r215.pickle", 'rb') as file:
            centers=pickle.load(file)
# cluster-r215-to-reduce-nclusters/cluster-centers-r215.pickle
# make center_xyz_all: [n_centers [n_atoms [x y z]]] 
    # first make an empty 3d array so there's no need to 
    # resize memory as center xyz coordinates are added. 
    center_xyz_all = np.zeros((len(centers), len(all_ca_atoms), 3)) 
    for center_ind, center in enumerate(centers): 
        center.superpose(pdb, atom_indices=all_ca_atoms, ref_atom_indices=all_ca_atoms)
        center_xyz_all[center_ind] = center.xyz[0, all_ca_atoms, :]  # (n_atoms, 3)
        # '0' = frame 0 (each center is 1 frame) 
        # ':' saves x, y, and z coordinates 

    # --------------------------------------------------------------------
    # load all bootstrap eq_probs
    eq_probs_boots = np.load(f'{cluster_dir_path}bootstrap_with_replacement/bootstrap_output_eq_probs_msm_lag50_n100straps.npy')  # 100 straps in FAH 
    n_boots = len(eq_probs_boots)  # n_boots = 1000 
    print(f"Running {n_boots} bootstraps") 
# cluster-r215-to-reduce-nclusters/bootstrap_with_replacement/bootstrap_output_eq_probs_msm_lag100_n100straps.npy
    rmsds_all_average = np.zeros((n_boots, len(all_ca_atoms))) # faster than empty array appending 
    rmsds_all_std     = np.zeros((n_boots, len(all_ca_atoms))) 
    
    for boot in range(n_boots):
        if boot % 100 == 0:
            print(f"Working on bootstrap {boot}/{n_boots}") 
        
        eq_probs = eq_probs_boots[boot]

        # get avg xyz for each residue across all centers. 
        center_xyz_avg = np.average(center_xyz_all, axis=0, weights=eq_probs)
        
        # calculate per-resi RMSD 
        diff = center_xyz_all - center_xyz_avg[np.newaxis]  # (n_centers, n_atoms, 3)
        # [np.newaxis] will turn center_xyz_avg array from (n_atoms, 3) to (1, n_atoms, 3) 
        rmsds_all = np.sum(diff**2, axis=-1)       # (n_centers, n_atoms)
        
        rmsds_avg = np.sqrt(np.average(rmsds_all, axis=0, weights=eq_probs))
        #rmsds_variance = np.average( (rmsds_all-rmsds_avg)**2, axis=0, weights=eq_probs )
        rmsds_all_average[boot] = rmsds_avg
        #rmsds_all_std[boot]     = np.sqrt(rmsds_variance)

    return rmsds_all_average, variable_resi_names 

