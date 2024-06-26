**TO DO: Add 'moleculeOBERedWithRandPhase.jl','moleculeOBEBlueWithRandPhase.jl' & various auxFunctions.jl, analysis.m, etc**


# JuliaOBESimulatorFullFinal

# NOTE regarding running these at home 

As written, these simulations are all assuming you are using the cluster.  If you want something to run on your home computer, either contact me (langin.thomas@gmail.com) or else just edit the file yourself (basically you just need to either hardcode the stuff that is in 'ARGS[]' explicitly and run in VSCode, or else open a julia instance and type something like 'julia goldSimForClusterRandPhase.jl -0.5 1.0 -0.5 1.0 50', which, in this instance, will run the gold MOT simulator with \delta_{F1}=-0.5, s_{0,F1}=1.0, \delta_{F2}=-0.5, s_{0,F2}=1.0, bGrad = 50 (gauss/cm)).  

If you want to run these at home, you will almost certainly want to reduce the 'numTrialsPerValueSet' variable.  This will give wildly divergent results for cases where the phase is randomized, so I would only recommend running the 'no rand phase' versions of the code (set 'useRandPhase' to zero!)

# silverBlueWithRandPhase.jl & testSilver.sbatch

Will run the OBE simulator for silver.  For this one, I allow three variables to be passed: the overall detuning (e.g., I've assumed you are detuning both lasers, one tuned to F=0 and one to F=1, with respect to the F'=1 state by the same amount), the total intensity, and the ratio of power addressing each hyperfine level R01 (R01=P_{F=0}/P_{F=1}).  The magnetic field is currently hardcoded to be 25 G/cm (clearly indicated in code: feel free to change this or else make it a user passable parameter like it is for the gold MOT).  Also, feel free to add a 'raman detuning' variable, or equivalent, to allow F=0 and F=1 to have different detunings with respect to F'=1.  I've already chosen the 'correct' polarizations for providing a restoring force, but if you want to mess with them, feel free to change the 'polSign' variable in the code.  I've also hard coded the waist to be 5 mm: to change this, change the 'waists' variable in the code

This is currently set up to run a simulation of a blueMOT from 0.02 mm to 1.0 mm displacements, for a velocity range from -7.5 to 7.5 m/s.  Results will be output into files called 'forceVsSpeedDisplacment(insertDisplacment)MMSameDir.dat'.  Results include columns indicating speed, a(v), \delta a(v), a(r), \delta a(r), and population in each hyperfine manifold (for both ground and excited state).

.sbatch file is used to submit the jobs

# goldRedWithRandPhase.jl & testGoldRed.sbatch

Runs OBE Simulator for gold red-MOT (see gold paper for details).  Currently set up to allow 5 variables to be passed: The detuning (note: detuning defined with respect to F'=2) & saturation intensity of the laser adressing F=1, the detuning and saturation intensity of the laser addressing F=2, and the magnetic field gradient (in gauss/cm).  As above, I have chosen the 'correct' polarizations for restoring forces, but feel free to mess with them as well as the waist.  

This is currently set up to run a simulation of a redMOT from 0.2 to 5 mm for velocities from 0 to 35 m/s.

.sbatch file is used to submit the jobs

# goldBlueWithRandPhase.jl & testGoldBlue.sbatch

Runs OBE Simulator for gold blue-MOT (see gold paper for details).  Currently set up to allow 5 variables to be passed (same as red-MOT above). As above, I have chosen the 'correct' polarizations for restoring forces, but feel free to mess with them as well as the waist.  

This is currently set up to run a simulation of a blue-MOT from 0.02 to 1 mm for velocities from 0 to 2 m/s.

.sbatch file is used to submit the jobs

# moleculeOBERedWithRandPhase.jl & testMolRed.sbatch (TO ADD LATER)

# moleculeOBEBlueWithRandPhase.jl & testMolBlue.sbatch (TO ADD LATER)

# auxFunctionsNewRandomizePhase.jl

This stores a bunch of functions ('clebch-gordan term' calculator, b-field terms, forces, the actual density matrix evolution operator, etc.) that are used in the gold/silver simulation.

# auxFunctionsNewRandomizePhaseMolecules.jl (TO ADD LATER)

This stores a bunch of functions ('clebch-gordan term' calculator, b-field terms, forces, the actual density matrix evolution operator, etc.) that are used in the molecule simulation.  Slightly different from the atomic 'auxFunctions' above due to the incorporation of both 'A' and 'B' excited states as well as j mixing, etc.

# various __Variables.jl (TO ADD LATER)

This stores relevant variables (wavenumbers, linewidths, hyperfine energies, etc.) relevant to the atoms/molecules.

# analysis__.m (TO ADD LATER)

Used to analyze data from the simulation to produce a(v,z), a(v), a(z), etc. plots and also to solve for things like capture velocity, \sigma, temperature, etc.  Code is reasonably self-explanatory but feel free to message me if you have any questions.
