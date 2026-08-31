# 07/15/2026
import numpy as np
import mdtraj as md
def get_sequence(structure_path):

    '''
    Get the residue sequence for a given chain from a given antibody.
    Inputs:
        sys_name = str | example = 'CH65_naive_VC'
    Output:
        str | Chain sequence
    '''
    # import the top cluster center for the given Ab system
    structure = md.load(structure_path)
    indices = structure.topology.select(f'name CA')
    sequence = ''.join(structure.topology.atom(atom_idx).residue.code for atom_idx in indices)
    return sequence, indices

def find_indices(full_seq, ca_indices, partial_seq):
    '''
    Given a full sequence and a loop/region sequence, find indices of the loop/region sequence
    '''
    start_index = full_seq.find(partial_seq)

    if start_index != -1:
        # Calculate the ending index (inclusive)
        end_index = start_index + len(partial_seq)
        print(full_seq[start_index:end_index])
        if full_seq[start_index:end_index] == partial_seq:
            return ca_indices[start_index:end_index]
    else:
        print('ERROR: FAILURE AT find_indices | CHECK SEQUENCE!')
        return None  # FR sequence not found

def partial_seq_check(structure_path, partial_seq_ca_indices, partial_seq):
    structure = md.load(structure_path)
    partial_seq_check = ''.join(structure.topology.atom(atom_idx).residue.code for atom_idx in partial_seq_ca_indices)
    if partial_seq != partial_seq_check:
        print(f'ERROR: FAILURE AT partial_seq_check | CHECK SEQUENCE! \n{partial_seq}\n{partial_seq_check}')



