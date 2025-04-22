#!/bin/bash

#SBATCH -p short
#SBATCH -t 0-12:00
#SBATCH -c 6
#SBATCH --mem 64G
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH -J star


# Load STAR module
module load gcc/6.2.0 star/2.7.0a

# Change directories to where the STAR results will be output
cd ~/RNAseq/results/STAR

#loop for running STAR in serial


for r1 in ~/RNAseq/rawdata/00_fastq/*_R1_*.fastq

do
r2=${r1/R1/R2} # replace R1 with R2
sample=${r1/R1_001.fastq/} # remove R1_001.fastq part
sample=${sample//*\//} # remove leading path to get sample name

# run STAR
STAR --genomeDir  ~/RNAseq/genome/Mus_musculus/NCBI/GRCm38/Sequence/starIndex \
--runThreadN 6 \
--readFilesIn $r1 $r2 \
--outFileNamePrefix ~/RNAseq/results/STAR/$sample \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard


done


