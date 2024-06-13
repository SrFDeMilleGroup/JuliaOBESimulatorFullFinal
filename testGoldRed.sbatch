#!/bin/bash
#SBATCH --job-name=goldTest1
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH -c 20
#SBATCH --mail-user=tlangin@uchicago.edu
#SBATCH --array=1-1

module load julia/1.7.2
##detF1s=(-0.5 -1.0 -1.5);
detF1s=(-0.5);
detF2s=(-1.0);
#detF2s=(-0.5 -1.0 -1.5 0.5 1.0 1.5);
##detF2s=(-1.0);
##s0F1s=(0.25 0.5 1.0);
s0F1s=(1.0);
s0F2s=(1.0);
bGrads=(50.0);
for detF1 in ${detF1s[@]}; do
  for s0F1 in ${s0F1s[@]}; do
    for detF2 in ${detF2s[@]}; do
      for s0F2 in ${s0F2s[@]}; do
        for bGrad in ${bGrads[@]}; do
          export JULIA_NUM_THREADS=20
          julia goldRedWithRandPhase.jl $detF1 $s0F1 $detF2 $s0F2 $bGrad
        done
      done
    done
  done
done
