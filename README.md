# JuliaOBESimulatorFullFinal

# NOTE regarding running these at home 

As written, these simulations are all assuming you are using the cluster.  If you want something to run on your home computer, either contact me (langin.thomas@gmail.com) or else just edit the file yourself (basically you just need to either hardcode the stuff that is in 'ARGS[]' explicitly and run in VSCode, or else open a julia instance and type something like 'julia goldSimForClusterRandPhase.jl -0.5 1.0 -0.5 1.0 50', which, in this instance, will run the gold MOT simulator with \delta_{F1}=-0.5, s_{0,F1}=1.0, \delta_{F2}=-0.5, s_{0,F2}=1.0, bGrad = 50 (gauss/cm)).  

If you want to run these at home, you will almost certainly want to reduce the 'numTrialsPerValueSet' variable.  This will give wildly divergent results for cases where the phase is randomized, so I would only recommend running the 'no rand phase' versions of the code (set 'useRandPhase' to zero!)

# silverBlueWithRandPhase.jl

Will run the OBE simulator for silver.  For this one, I only allowed two variables to be passed: the overall detuning (e.g., I've assumed you are detuning both lasers, one tuned to F=0 and one to F=1, with respect to the F'=1 state by the same amount) and the total intensity.  

TO DO: Add 'moleculeOBERedWithRandPhase.jl','moleculeOBEBlueWithRandPhase.jl','silverBlueWithRandPhase.jl','goldBlueWithRandPhase.jl','goldRedWithRandPhase.jl' & various auxFunctions.jl, analysis.m, etc
