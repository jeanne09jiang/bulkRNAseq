#!/bin/bash

#SBATCH -p short
#SBATCH -t 0-12:00
#SBATCH -c 6
#SBATCH --mem 16G
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH -J salmon_in_serial


# Load Salmon module
module spider salmon/1.8.0
module load salmon/1.8.0

# Change directories to where the Salmon results will be output
cd ~/RNAseq/results/Salmon

#loop for running salmon in serial

for r1 in ~/RNAseq/raw_data/*_R1_*.fastq

do
r2=${r1/R1/R2} # replace R1 with R2
sample=${r1/R1_001.fastq/} # remove R1_001.fastq part
sample=${sample//*\//} # remove leading path to get sample name


# run salmon
salmon quant -i ~/RNAseq/genome/salmon_mm_index \
 -l A \
 -1 $r1 \
 -2 $r2 \
 -o quants/${sample}_salmon \:
 --seqBias \
 --useVBOpt \
 --validateMappings \
 -p 8 \
 --numBootstraps 30

done