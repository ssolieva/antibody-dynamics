# antibody-dynamics
This repository contains all simulation and analysis code related to the antibody dynamics manuscript.

## Directory Structure
	antibody-dynamics/
	|-- analysis-files/
        | |-- clustering/
        | | |-- scripts
        | | | |-- cluster-data.sh        # Code for clustering simulation frames
        | | | |-- make-msms.slurm        # Slurm submission for the ITS + MSM scripts 
        | | | |-- make_imp_tscale.py     # Code for implied time scales (ITS)
        | | | |-- make_msm.py            # Code for building Markov state model (MSM)
        | | | |-- submit-cluster-data-CPU-CH103-lineage.sh # Slurm submission for cluster + MSM steps. 
	|-- md-files/                    # Code for running simulations (equilibration + FAST)
	| |-- simulation-FAST-code/      # FAST
	| | |-- run-fast-alt.py          # Code for running FAST
	| | |-- save_inds.py             # Code for generating atom_indices.dat for FAST
	| | |-- slurm_submission         # Slurm submission file to submit FAST job
	| |-- simulation-mdp-files/      # equilibration 
	| | |-- Makefile                 # Code for running all equilibration steps
	| | |-- ions.mdp
	| | |-- minim.mdp
	| | |-- npt-charmm.mdp
	| | |-- nvt-charmm.mdp
	| | |-- pr-50ns.mdp 
	| | |-- slurm_submission         #  Slurm submission file to submit equilibration
	|-- LICENSE
        |-- README.md

