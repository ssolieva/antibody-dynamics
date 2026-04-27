# use this to create an atom_indices.dat file
# copy output to atom_indices.dat file 

import numpy as np
import mdtraj as md 

sim_name = 'CH103_naive_VC'

pdb = md.load(f"{sim_name}-prot-masses.pdb")
resis = "96 to 111" # residues
atom_inds = pdb.topology.select(f"protein and chainid 0 and residue {resis} and name N CA CB C O")


for i in atom_inds:
    #print(i)
    print(i, pdb.topology.atom(i))

