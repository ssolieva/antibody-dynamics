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

# make 100 different lag times (integers) geometrically spaced between 10 and 5000 frames
lag_times = np.unique(np.geomspace(2, 500, num=50).astype(int))

n_states = len(np.unique(assigs))

implied_timescales = []
for time in lag_times:
    print(f'Making implied timescale for lagtime: {time}.',flush=True)
    bE4 = partial(builders.normalize, prior_counts=1/n_states)
    m = msm.MSM(
        lag_time=time,
        method=bE4)
    m.fit(assigs)

    implied_timescales.append(
        -time / np.log(msm.eigenspectrum(m.tprobs_, n_eigs=5)[0][1:5])
    )

implied_timescales = np.vstack(implied_timescales)
fig, (ax1,ax2)=plt.subplots(2,1)
ax2.set_xlabel('lag time (frames)')
ax1.set_yscale('log')
for i in range(implied_timescales.shape[1]):
    ax1.plot(lag_times, implied_timescales[:, i],
             label='$\lambda_{%s}$' % (i+1))
    ax2.plot(lag_times, implied_timescales[:, i],
             label='$\lambda_{%s}$' % (i+1))
plt.show()
plt.savefig(f'{savepath}/Imp_timescales.png')
