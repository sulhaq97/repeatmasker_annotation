#!/bin/bash
# the following are sbatch parameters
#SBATCH -t 5:00:00
#SBATCH -p himem
#SBATCH --mem=60G
#SBATCH -c 1
#SBATCH -N 1
#SBATCH -o %x-%j.out


module load R/3.6.1

echo 'Starting R driver script (R version 3.6.1)'

Rscript repeat.masker.non_coding.data.reader.R

echo 'Finished running driver script'
