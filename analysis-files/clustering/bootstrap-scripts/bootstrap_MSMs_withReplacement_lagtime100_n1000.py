# n_bootstraps = 1000
# lagtime = 100

from enspara.msm import MSM, builders
from enspara import ra
import ctypes
import itertools
import multiprocessing as mp
import numpy as np
import os
from functools import partial
import random

#---------------------------------------------------
MSM_lag_time = 100  #using one lag time 
#---------------------------------------------------
# This is an adaptation of a bootstrap script from Tony Trent
# Choose 50 random trajectories with replacement, then build MSM. 
# Repeat 1000 times (1000 bootstraps) 

def bootstrap(data):
    '''
    draw n_trials=1000 random samples of size len(data) from data with replacement 
    straps is a [number of replicates] x [number of trajectories] (1000 x 50 x 2501)
     x [number of trajectory frames] array
    '''
    n_trials = 1000
    straps = []
    kept_indices = []
    for i in np.arange(n_trials):  
        indsKeep = random.choices(range(0,50), k=50)
        kept_indices.append(indsKeep)
        current = [data[j] for j in indsKeep]
        straps.append(ra.RaggedArray(current))
    print(f'Num of straps: {len(straps)}')
    return straps, kept_indices 

def eq_pop(assignments, MSM_lag_time, strapid):
    '''
    assignments is a [number of trajectories] x [number of trajectory frames]
    ragged array of cluster centers to which each frame of each trajectory is assigned
    '''
    #checks input datatype and reads/converts data to a set type
    if isinstance(assignments, ra.RaggedArray):
    	unique_states = np.unique(assignments._data)
    else:
    	unique_states = np.unique(assignments.flatten())
    	print("flattened")

    if strapid % 100 == 0:
        print("Building MSM %s" % strapid)
    b = partial(builders.normalize, prior_counts=1/nctrs) 
    msm_obj = MSM(lag_time=MSM_lag_time, method=b, max_n_states=nctrs) 
        
        
        # setting max_n_states makes sure that centers not visited by the trajectories 
        # used for a particular round of bootstrapping are still included in the MSM 
        # (connected only by prior counts and therefore lacking ergodic sampling) so 
        # that all TMPs/EPVs have the same dimensions 
 
    msm_obj.fit(assignments)
    #debugging
    if len(msm_obj.tprobs_)-len(msm_obj.tprobs_[0]) != 0:
    	print(len(msm_obj.tprobs_)-len(msm_obj.tprobs_[0]))
    return msm_obj.eq_probs_, msm_obj.tprobs_, msm_obj.tcounts_

#################################
# load data and determine the total number of cluster centers
print("Loading assignments")
assignments = ra.load(f"../cluster-assignments.h5")
print(f"Assignments loaded! {len(assignments)} trajs x {len(assignments[0])} frames")
nctrs = len(np.unique(assignments.flatten())) # number of unique assignments 
print(f"{nctrs} unique cluster centers") 

#perform sampling for bootstrapping
print("Starting bootstraps")
straps, kept_indices = bootstrap(assignments)
np.save("n1000_bootstrap_chosen_indices.npy", kept_indices) 

# AI suggestion to speed up script:  
#   replace the serial list comprehension:
#   all_pops = [eq_pop(assig, MSM_lag_time, n) for n,assig in enumerate(straps)]
eq_pop_partial = partial(eq_pop, MSM_lag_time=MSM_lag_time)
with mp.Pool(processes=mp.cpu_count()) as pool:
    all_pops = pool.starmap(eq_pop,
                            [(assig, MSM_lag_time, n)
                             for n, assig in enumerate(straps)])

#compile separate arrays of equilibrium and transition probabilities
all_eq_probs  = [x[0] for x in all_pops]
all_t_probs  = [x[1] for x in all_pops]
all_t_counts = [x[2] for x in all_pops]

#save equilibrium and transition probabilities
print('Saving output')
np.save(f"bootstrap_output_eq_probs_msm_lag{MSM_lag_time}_n1000straps.npy", all_eq_probs)
np.save(f"bootstrap_output_t_probs_msm_lag{MSM_lag_time}_n1000straps.npy", all_t_probs)
np.save(f"bootstrap_output_t_counts_msm_lag{MSM_lag_time}_n1000straps.npy", all_t_counts)    
print('Completed.')
