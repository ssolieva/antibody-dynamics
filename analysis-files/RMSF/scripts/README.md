# scripts related to RMSF calculations, in approximate order of how they should be looked at and run. 

## Scripts for FAST simulations:
	-- Ab_CA_RMSF_VHC_VLC.py         # Code for RMSF calculations
	-- Ab_CA_RMSF_VHC_VLC_toolbox.py # Functions for RMSF calculations
	-- submit-rmsf.sh                # Slurm submission for RMSF code
	-- bootstraps_CaRMSF_perResi_VHC_VLC.py # Code for bootstrap RMSF calculations
	-- bootstraps_toolbox.py 	 # Functions for bootstrap RMSF calculations
	-- submit-boots.sh 		 # Slurm submission for bootstraps 
	-- Ab_CA_RMSF_VHC_VLC_variable_lag.py # Code for RMSF calculations with varied lag time
	-- Ab_CA_RMSF_VHC_VLC_variable_cluster_radius.py # Code for RMSF calculations with varied cluster radius.
	-- bootstraps_CaRMSF_perResi_VHC_VLC_variable_lag.py # Code for bootstrap RMSF calculations with varied lag time.
	-- bootstraps_CaRMSF_perResi_VHC_VLC_variable_cluster_radius.py # Code for bootstrap RMSF calculations with varied cluster radius


## Scripts for Folding@home simulations:
	-- FAH-Ab_CA_RMSF_VHC_VLC.py 	# Code for RMSF calculations 
	-- FAH_bootstraps_toolbox.py 	# Functions for RMSF calculations
	-- FAH-submit-rmsf.sh		# Slurm submission for RMSF code
	-- FAH-bootstraps_CaRMSF_perResi_VHC_VLC.py # Code for bootstrap RMSF calculations
	-- FAH_bootstraps_toolbox.py 	# Functions for bootstrap RMSF calculations
	-- FAH-submit-boots.sh 		# Slurm submission for bootstraps 


## Scripts to parse RMSF data by defined regions
### Contains all code used to parse the data and plot the data. All region/cdr definitions are included in each respective script. 	
	-- parse_by_sequence/FAST_VC_simulations # FAST simulations, variable + constant regions simulations.
	-- parse_by_sequence/FAST_V_simulations # FAST simulations, variable-only simulations. 
	-- parse_by_sequence/FAH_VC_simulations_CI # Folding@home simulations.
