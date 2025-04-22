#!/bin/bash

#SBATCH -p short
#SBATCH -t 0-12:00
#SBATCH -c 6
#SBATCH --mem 64G
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH -J star

# Load qualimap module
module load java/jdk-1.8u112 qualimap/2.2.1

# Change directories to where data is
cd ~/RNA-seq/rawdata

mkdir -p ~/RNA-seq/results/qualimap

unset DISPLAY

qualimap rnaseq \
-outdir results/qualimap/ \
-a proportional \
-bam results/STAR/GATA3_Aligned.sortedByCoord.out.bam \
-p strand-specific-reverse \
-gtf ~/RNAseq/genome/Mus_musculus/NCBI/GRCm38/Annotation/Genes/genes.gtf \
--java-mem-size=8G