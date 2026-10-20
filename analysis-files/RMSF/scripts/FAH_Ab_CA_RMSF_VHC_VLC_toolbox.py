import numpy as np
import mdtraj as md
import pickle

# INPUTS EXAMPLES:
#sys_path=    "apo/CH103_naive_V"
#start_of_VH= "1"
#end_of_VH=   "121"
#start_of_VL= "1"
#end_of_VL=   "108"

def calculate_Ab_CA_RMSF(sys_path, start_of_VH, end_of_VH, start_of_VL, end_of_VL, radius_path):
    '''
    Heavy chain should be the first chain (Chain A or chainid 0)
    Light chain should be the second chain (Chain B or chainid 1)
    prot_masses_uniform.pdb = chainid and residue numbering may have been altered to be uniform across all lineage members.
    Output RMSD values are in nm units.
    '''
    print("--------------------------------------------------------------")
    print("| Running calculate_Ab_CA_RMSD_per_resi_to_average_structure |")
    print("--------------------------------------------------------------")

    # define inputs directory path and print out all input variables.
    if sys_path=="apo/CAP256_naive_VC":
        cluster_dir_path = f"{radius_path}/data/{sys_path}/"
        centers_path=f"{cluster_dir_path}/cluster-centers-r215.pickle"
    if sys_path=="apo/CAP256_mature_VC":
        cluster_dir_path = f"{radius_path}/data/{sys_path}/"
        centers_path=f"{cluster_dir_path}/cluster-centers-r215.pickle"
    else:
        cluster_dir_path = f"{radius_path}/data/{sys_path}/"
        centers_path=f"{cluster_dir_path}/cluster-centers.pickle"

    print("\tINPUTS:", cluster_dir_path, '\n\t\t',start_of_VH, end_of_VH, start_of_VL, end_of_VL)

    # select alpha carbons from the variable region:
    pdb_path = f'{cluster_dir_path}prot_masses_uniform.pdb'

    #pdb_path = f'/mnt/pure/bowmanlab/WG-shahlo/projects/Ab_dynamics/analysis/clustering/radius_15_variable/data/{sys_path}/prot_masses.pdb'
    pdb = md.load(pdb_path)
    all_ca_atoms = pdb.topology.select(f'chainid 0 and residue {start_of_VH} to {end_of_VH} and name CA or chainid 1 and residue {start_of_VL} to {end_of_VL} and name CA')

    # check to make sure that the atoms / atom indicies selected are from the correct residues.
    variable_resi_names = []
    for i in range(len(all_ca_atoms)):
        variable_resi_names.append(pdb.topology.atom(all_ca_atoms[i]).residue)
        print(all_ca_atoms[i], pdb.topology.atom(all_ca_atoms[i]))

    # load in the cluster centers from the clustering step.
    file=centers_path
    with open(file, 'rb') as file:
        centers=pickle.load(file)

    # load in the equilibrium probabilities from the MSM step.
    eq_probs = np.load(f'{cluster_dir_path}eq_probs_msm_50.npy')
    print(sum(eq_probs))
    print(f'\tnumber of cluster centers: {len(eq_probs)}, {len(centers)}')

    # make a list of all center XYZ positions.
    # dimensions: [number of centers [1 [number of atoms [X Y Z]]]
    center_xyz_all = []
    for center_ind in range(len(centers)):
        centers[center_ind].superpose(pdb, atom_indices=all_ca_atoms, ref_atom_indices=all_ca_atoms)
        center_xyz = centers[center_ind].xyz[:, all_ca_atoms, :]
        center_xyz_all.append(center_xyz)
    print(len(center_xyz_all), len(center_xyz_all[0]), len(center_xyz_all[0][0]), len(center_xyz_all[0][0][0]))

    #print(all_ca_atoms)

    # calculate average x y z positions across cluster centers for each atom. Use eq_probs to weight each center accordingly
    center_xyz_avg = np.average(center_xyz_all, axis=0, weights=eq_probs)
    rmsfs_all = []
    for center_ind in range(len(centers)): # for each center in centers list
        rmsfs_per_res = [] # rmsf per residue.
        centers[center_ind].superpose(pdb, atom_indices=all_ca_atoms, ref_atom_indices=all_ca_atoms) # align center to the original loaded pdb file.
        center_xyz = centers[center_ind].xyz[:, all_ca_atoms, :] # get the XYZ positions from the center for each selected CA atom
        for n in range(len(center_xyz_avg[0])): # for each residue (residue here means CA atom)
            x_diff_sqr = (center_xyz_avg[0][n][0] - center_xyz[0][n][0])**2
            y_diff_sqr = (center_xyz_avg[0][n][1] - center_xyz[0][n][1])**2
            z_diff_sqr = (center_xyz_avg[0][n][2] - center_xyz[0][n][2])**2
            rmsfs_per_res.append(np.sum([x_diff_sqr, y_diff_sqr, z_diff_sqr]))
        rmsfs_all.append(rmsfs_per_res)
    rmsfs_all_average = np.sqrt(np.average(rmsfs_all, axis=0, weights=eq_probs))
    return rmsfs_all_average, variable_resi_names


