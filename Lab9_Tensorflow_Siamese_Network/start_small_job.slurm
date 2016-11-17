#!/bin/bash

#SBATCH --time=00:15:00   # walltime
#SBATCH --ntasks=16   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=3072M   # memory per CPU core
#SBATCH -J "isai_tensorflow"   # job name
#SBATCH --mail-user=isai.mercado.oliveros@gmail.com   # email address

# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module add cuda
module load cudnn/4.0_gcc-4.4.7
module add tensorflow/0.9.0_python-2.7.11+cuda

python ~/tensorflow/siamese/train_model.py
