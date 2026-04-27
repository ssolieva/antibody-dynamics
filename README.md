# antibody-dynamics
This repository contains all simulation and analysis code related to the antibody dynamics manuscript.

## Directory Structure
cat << 'EOF' > DIRECTORY_STRUCTURE.txt
antibody-dynamics/
│── md-files/ # Code for running simulations (equilibration + FAST)
│ │── simulation-FAST-code/ # FAST
│ │ │── run-fast-alt.py # Code for running FAST
│ │ │── save_inds.py # Code for generating the atom_indices.dat file needed for FAST
│ │ │── slurm_submission # Slurm submission file to submit FAST job
│ │── simulation-mdp-files/ # equilibration 
│ │ │── Makefile 
│ │ │── ions.mdp
│ │ │── minim.mdp
│ │ │── npt-charmm.mdp
│ │ │── nvt-charmm.mdp
│ │ │── pr-50ns.mdp 
│ │ │── slurm_submission 
│── README.md
EOF
