#/bin/bash
# SCANimate Install Script, Updated for cobra


module load gcc/8
module load cuda/10.1
# module load anaconda/3/2020.02

echo "Set up conda env for scanimate..."
conda create --name scanimate python=3.6

conda init bash
exec $SHELL
conda activate scanimate

echo "Done!"
