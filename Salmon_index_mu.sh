# module load salmon/1.4.0

## Obtain a transcriptome and building an index

# Download from the FTP server
wget ftp://ftp.ensembl.org/pub/release-105/fasta/mus_musculus/cdna/Mus_musculus.GRCm39.cdna.all.fa.gz
# Decompress the FASTA file
gzip -d Mus_musculus.GRCm39.cdna.all.fa.gz
# run the indexing
salmon index \
-t ~/RNA-seq/genome/Mus_musculus.GRCm39.cdna.all.fa \
-i salmon_index \
-k 31

# or
curl ftp://ftp.ensembl.org/pub/release-105/fasta/mus_musculus/cdna/Mus_musculus.GRCm39.cdna.all.fa.gz -o mm.fa.gz

salmon index -t mm.fa.gz -i mm_index


