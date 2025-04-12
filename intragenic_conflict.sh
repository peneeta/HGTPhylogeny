#!/bin/bash

# Intragenic Conflict Analysis
# Run these as individual commands

GYRA_PATH="./intragenic_conflict/gyrA/subset_gyrA_cds_all_bacteria_conserved.fasta"
GYRA_ALIGN_PATH="./intragenic_conflict/gyrA/subset_gyrA_aligned.fasta"
GYRA_TRIMMED_PATH="./intragenic_conflict/gyrA/subset_gyrA_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env (i use mamba)
conda activate phylo

# perform alignment
mafft --auto "$GYRA_PATH" > "$GYRA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$GYRA_ALIGN_PATH" -out "$GYRA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$GYRA_TRIMMED_PATH" -w 500 -i 100 -p -t 2