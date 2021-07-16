#!/bin/bash -l
#
## This is your working directory
#SBATCH -D /u/gtiwari/SCANimate/
#
# Job Name Shown in the Queue (squeue)
#SBATCH -J SCANimate
#
## Standard ouput and error from your program. These are relative to the working directory
#SBATCH -o ./testing/render.out.%j
#SBATCH -e ./testing/render.err.%j
#
# We are interested in nodes with GPUs, i.e., GPU Queue (Partition):
#SBATCH --partition=gpu
#
# Node feature:
#SBATCH --constraint="gpu"
#SBATCH --gres=gpu:v100:1       # If using only 1 GPU of a shared node
#SBATCH --mem=92500
#
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1     # This stays 1 for 2 GPU training too, in most cases
#SBATCH --cpus-per-task=16      # Number of processes ?? (Each GPU has 16 workers ??)
#
#
# wall clock limit:
#SBATCH --time=00:10:00         #Specify a smaller duration if your script takes less time

module load gcc/8
module load cuda/10.1
module load anaconda/3/2020.02

source /mpcdf/soft/SLE_12/packages/x86_64/anaconda/3/2020.02/etc/profile.d/conda.sh
conda activate scanimate

python -m ./apps.test_scanimate -c ./data/pretrained_configs/release_03223_shortlong.yaml -t ./data/test/gLO_sBM_cAll_d14_mLO1_ch05
python ./render/render_aist.py -i demo_result/results_test/release_03223_shortlong_test_gLO_sBM_cAll_d14_mLO1_ch05/ -o demo_result
