#!/usr/bin/env bash
#SBATCH -J debug-cooptimization
#SBATCH -p gpu
#SBATCH --account DMOBLEY_LAB_GPU
#SBATCH -t 7-00:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16gb
#SBATCH --output slurm-%x.%A.out

. ~/.bashrc

micromamba activate co-optimization-cuda

python refit.py                                             	\
    --port                      8131                    	\
    --n-min-workers         	1                          	\
    --n-max-workers         	23                        	\
    --memory-per-worker     	4                           	\
    --walltime              	"08:00:00"                  	\
    --queue                 	"gpu"                       	\
    --conda-env                 co-optimization-cuda		\
    --extra-script-option   	"--gres=gpu:1"
