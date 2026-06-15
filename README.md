# antibody-dynamics
This repository contains all simulation and analysis code related to the antibody dynamics manuscript.

## Directory Structure
	antibody-dynamics/
	|-- analysis-files/
	| |-- clustering/
	| | |-- bootstrap-scripts/                                   # Bootstrapping MSMs for error bars
	| | | |-- bootstrap_MSMs_withReplacement_lagtime100_n1000.py # Code for bootstrapping MSMs
	| | | |-- run-submit-bootstrap-CPU.sh                        # Bash script to recursively submit slurm submission 
	| | | |-- submit-bootstrap-lagtime100-n1000-CPU.sh           # Slurm submission for bootstraps 
	| | |-- scripts/                 # Code for clustering + building MSMs
	| | | |-- cluster-data.sh        # Code for clustering simulation frames
	| | | |-- make-msms.slurm        # Slurm submission for the ITS + MSM scripts 
 	| | | |-- make_imp_tscale.py     # Code for implied time scales (ITS)
 	| | | |-- make_msm.py            # Code for building Markov state model (MSM)
	| | | |-- submit-cluster-data-CPU-CH103-lineage.sh # Slurm submission for cluster + MSM steps.
        | | -- RMSF/
        | | | -- scripts/
        | | | | -- Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure.py         # Code for RMSF calculations 
        | | | | -- Ab_CA_RMSD_per_resi_VHC_VLC_to_start_or_average_structure_toolbox.py # Functions for RMSF calculations
        | | | | -- submit-rmsd-CPU-CH103-lineage.sh                                     # Slurm submission for RMSF code
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

