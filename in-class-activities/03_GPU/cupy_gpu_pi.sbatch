#!/bin/bash
#SBATCH --job-name=activity_cupy
#SBATCH --output=activity_cupy.out
#SBATCH --time=00:03:00      # cancels job after 3 minutes of wall time
#SBATCH --partition=gpu      # GPU partition
#SBATCH --nodes=1            # 1 GPU node
#SBATCH --ntasks=1           # 1 CPU core to drive GPU
#SBATCH --gres=gpu:1         # Request 1 GPU
#SBATCH --constraint=rtx6000 # specify GPU model; alternatives: v100, a100
#SBATCH --account=macs30113

module load python/anaconda-2022.05 cuda/11.7
module load cupy
module load cuda

python activity.py
