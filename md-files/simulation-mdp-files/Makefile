# This is a script that will run all steps of the md equilibration. 
# It was adapted from a script by Artur Meller. 
#
# Here is a summary of the steps and parameters:
#    PARAMETERS:
# 	- force field = Charmm36m
# 	- water model = tip3p
# 	- box 	      = dodecahedron (saves space / avoids having corners where the protein doesn't fit)
# 	- box edge    = 1.0 nm (standard) 
# 	- pbc 	      = cluster (periodic boundary condition, cluster all atoms to the center of mass of the cluster)
# 	- solvent     = 0.1 M NaCl, neutral charge (100 mM NaCl, physiological conditions)
# 	
#    STEPS:
# 	1. convert your PDB to gromacs format
# 	2. make simulation box 
# 	3. solvate simulation box (add water)
# 	4. add salt and neutralize charge
# 	5. minimize structure (remove clashes)
# 	6. nvt (constant Number, Volume, Temperature equilibration to stabilize temperature. See nvt.mdp for parameters)
# 	7. npt (constant Number, Pressure, Temperature equilibration to stabilize density) 
# 	8. end with a start.gro and a prot-masses.pdb for running production runs from. 
 

tag = CH103_naive_VC
pdb = $(tag).pdb

ff = charmm36-jul2022
water = tip3p
box_geometry = dodecahedron
box_edge_distance = 1.0 

# use the following pbc approach
pbc = cluster

#sets solvent NaCl concentration in M otherwise ionize to neutral charge
molar_nacl = 0.1
pname = NA
nname = CL

# use sed to delete final line
d = d

.PHONY : prot-masses
prot-masses : $(tag)-prot-masses.pdb

.PHONY : npt_equilibrated
npt_equilibrated : $(tag)_npt.gro

.PHONY : nvt_equilibrated
nvt_equilibrated : $(tag)_nvt.gro

.PHONY : minimized
minimized : $(tag)_min.gro

.PHONY : solvated
solvated : $(tag)_solv.gro

.PHONY : clean
clean :
	find . ! -name "*.pdb" ! -name "Makefile" ! -name "em.mdp" ! -name "pr.mdp" ! -name "README*" ! -name "*.zip" -delete

$(tag)-prot-masses.pdb : $(tag)-start.gro
	        echo '1 10' | gmx trjconv -f $(tag)_npt.gro -o $(tag)-prot-masses.pdb -s $(tag)_npt.tpr -pbc $(pbc)

$(tag)-start.gro : $(tag)_npt.gro
	        echo '1 1 0' | gmx trjconv -f $(tag)_npt.gro -o $(tag)-start.gro -s $(tag)_npt.tpr -pbc $(pbc) -center

$(tag)_npt.gro : $(tag)_npt.tpr
	bash -c "gmx mdrun -v -deffnm $(tag)_npt 2>&1 | tee npt_equilibration.log"

$(tag)_npt.tpr : $(tag)_nvt.gro npt-charmm.mdp
	gmx grompp -f npt-charmm.mdp -c $(tag)_nvt.gro -p $(tag).top -t $(tag)_nvt.cpt -o $(tag)_npt.tpr -maxwarn 1 -r $(tag)_nvt.gro

$(tag)_nvt.gro : $(tag)_nvt.tpr
	bash -c "gmx mdrun -v -deffnm $(tag)_nvt 2>&1 | tee nvt_equilibration.log"

$(tag)_nvt.tpr : $(tag)_min.gro nvt-charmm.mdp
	gmx grompp -f nvt-charmm.mdp -c $(tag)_min.gro -p $(tag).top -o $(tag)_nvt.tpr -maxwarn 1 -r $(tag)_min.gro

$(tag)_min.gro : $(tag)_min.tpr
	bash -c "gmx mdrun -v -deffnm $(tag)_min 2>&1 | tee minimization.log" && grep "Steepest Descents converged to Fmax" minimization.log

$(tag)_min.tpr : $(tag)_ions.gro minim.mdp
	gmx grompp -f minim.mdp -c $(tag)_ions.gro -p $(tag).top -o $(tag)_min.tpr

$(tag)_ions.gro : $(tag)_solv.tpr
ifdef molar_nacl
	echo "SOL" | gmx genion -s $(tag)_solv.tpr -o $(tag)_ions.gro -p $(tag).top -pname $(pname) -nname $(nname) -conc $(molar_nacl) -neutral
else
	echo "SOL" | gmx genion -s $(tag)_solv.tpr -o $(tag)_ions.gro -p $(tag).top -neutral
endif

$(tag)_solv.tpr : $(tag)_solv.gro ions.mdp
	gmx grompp -f ions.mdp -c $(tag)_solv.gro -p $(tag).top -o $(tag)_solv.tpr

$(tag)_solv.gro : $(tag)_box.gro
	gmx solvate -cp $(tag)_box.gro -cs -o $(tag)_solv.gro -p $(tag).top

$(tag)_box.gro : $(tag).gro
	bash -c "gmx editconf -c -f $(tag).gro -o $(tag)_box.gro -bt $(box_geometry) -d $(box_edge_distance) 2>&1" > editconf.log

$(tag).gro $(tag).top : $( pdb )
ifdef vsite_atoms
	bash -c "gmx pdb2gmx -f  $(pdb) -o $(tag).gro -p $(tag).top -ff $(ff) -ignh -vsite $(vsite_atoms) -water $(water) 2>&1" > prot.info || cat prot.info
else
	bash -c "gmx pdb2gmx -f  $(pdb) -o $(tag).gro -p $(tag).top -ff $(ff) -ignh -water $(water) 2>&1" > prot.info || cat prot.info
endif

# Equilibration will occur at 2 fs timestep
