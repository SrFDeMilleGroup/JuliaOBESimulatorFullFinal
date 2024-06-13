#!/bin/bash
#SBATCH --job-name=silverTest
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH -c 20
#SBATCH --mail-user=tlangin@uchicago.edu
#SBATCH --array=1-1

module load julia/1.7.2
detunings=(1.0);
s0s=(2.0);
R01s=(4.0);
for detuning in ${detunings[@]}; do
  for s0 in ${s0s[@]}; do
    for R01 in ${R01s[@]}; do
      export JULIA_NUM_THREADS=20
      julia silverSimForClusterWithRandPhase.jl $detuning $s0 $R01
    done
  done
done
