#!/bin/bash
#SBATCH -J debug-cooptimization
#SBATCH -p gpu
#SBATCH --account DMOBLEY_LAB_GPU
#SBATCH -t 7-00:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16gb
#SBATCH --output slurm-%x.%A.out


source ~/.bashrc
micromamba activate co-optimization-cuda

mkdir -p logs

export CUDA_VISIBLE_DEVICES=0
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export TMPDIR=.

# create results dir and placeholder
mkdir -p result/optimize
touch result/optimize/force-field.offxml

#launch evaluator and FB
python run_evaluator.py > logs/evaluator.log 2>&1
