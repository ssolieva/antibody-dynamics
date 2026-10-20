# antibody-dynamics
This repository contains all simulation and analysis code related to the antibody dynamics manuscript.

## Directory Structure
	antibody-dynamics/
	|-- analysis-files/
	| |-- aggregate-simulation-time/
	| | |-- notebooks/
	| | | |-- FAH-trajLength-distributions.ipynb # Figure S2, Folding@home simulation trajectory length distribitions 
	| | |-- figures/ # Histograms from Figure S2.	
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
	| | -- distance-to-antigen/
	| | | -- data/
	| | | | -- to_glycan/            # CSV files with distance values
	| | | | -- to_protein/           # CSV files with distance values
	| | | -- notebooks/
	| | | | -- RMSFperResi_alignSeq_DistPlots.ipynb # notebook for aligning by sequence and making plots
	| | | | -- calcGlycanDist.ipynb  # notebook for antibody-glycan distance calculations
	| | | | -- calcProteinDist.ipynb # notebook for antibody-protein distance calculations
	| | -- paratope_RMSD/
	| | | -- data/
	| | | | -- # numpy file for all framework region indices.
	| | | -- notebooks
	| | | | -- calculateRMSD.ipynb # final RMSD calculation + figures
	| | | | -- FR_indices_toolbox.py # functions used in notebooks here.
	| | | | -- get_indices*ipynb # notebooks to get alignemnt indices / residue numbers.
	| | -- RMSF/
	| | | -- scripts/
	| | | | -- Ab_CA_RMSF_VHC_VLC.py         # Code for RMSF calculations 
	| | | | -- Ab_CA_RMSF_VHC_VLC_toolbox.py # Functions for RMSF calculations
	| | | | -- submit-rmsf.sh                           # Slurm submission for RMSF code
	| | | | -- # other scripts are described in the readme.md in this directory.
	| | | | -- parse_by_sequence/ # all code for parsing through rmsf data for Regions + CDR loops
	| | | -- notebooks/
	| | | | -- RMSF_Fab_vs_Fv.ipynb # Notebook to make Figure 2A 
	| | | | -- RMSF_bothChain_onlyHC_onlyLC.ipynb # Notebook to make Figures 1A, 1C, 2B, S4.
	| | | | -- RMSF_and_distance_plots.ipynb # Notebook to make Figures S7, S8-S14, 3A, 4A, 5A
	| | -- starting_RMSD/ # calculating RMSD of the cluster centers to the starting structure. 
	| | | -- notebooks/
	| | | | -- calculateRMSD_FAH.ipynb # Folding@home RMSD calculation +  figures
	| | | | -- calculateRMSD.ipynb # FAST RMSD calculation + figures
	| | | | -- calculateRMSD_V_only.ipynb # FAST V-only calculation + figures
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
	| | -- simulation-starting-structures
	| | | -- README.md # link to OSF 
	|-- LICENSE
	|-- README.md

