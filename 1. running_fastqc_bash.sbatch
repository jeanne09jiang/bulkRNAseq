#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-6:00 		# time limit
#SBATCH -c 6 		# number of cores
#SBATCH --mem 12G   # requested memory
#SBATCH --job-name rnaseq_fastqc 		# Job name
#SBATCH -o %j.out			# File to which standard output will be written
#SBATCH -e %j.err 		# File to which standard error will be written

## Change directories to where the fastq files are located
cd ~/RNAseq/rawdata/00_fastq
## Load modules required for script commands
module load fastqc/0.11.5

## make directory to store output of FastQC
mkdir ~/RNAseq/results/fastqc

#run FastQC use the muti-threading functionality for 12 jobs at once 
fastqc -o ~/RNAseq/results/fastqc -t 12 *.fastq.gz

# To run it: sbatch running_fastqc.run
# Save submitted batch job JobID
# Move .err and .out files to logs directory
