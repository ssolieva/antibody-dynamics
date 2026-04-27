from enspara import msm
import numpy as np
import matplotlib.pyplot as plt
from enspara.util import array as ra
from enspara.msm import MSM, builders
import mdtraj as md
from functools import partial
from sys import argv as argv

assigs=ra.load(argv[1])
savepath=str(argv[2])
filename=str(argv[3])

n_states=len(np.unique(assigs))
b = partial(builders.normalize, prior_counts=1/n_states)
lagtimes=[10, 25, 50, 100, 200, 250]
for lag in lagtimes:
    m = msm.MSM(
        lag_time=lag,
        method=b,trim=False)
    m.fit(assigs)
    pops=m.eq_probs_
    tprobs= m.tprobs_
    tcounts=m.tcounts_
    np.save(f'{savepath}/eq_probs_{filename}_{lag}',pops)
    np.save(f'{savepath}/t_probs_{filename}_{lag}',tprobs)
    np.save(f'{savepath}/t_counts_{filename}_{lag}',tcounts)
