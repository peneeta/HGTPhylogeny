#!/bin/bash

# Intragenic Conflict Analysis
# (this file contains all commands run for intragenic conflict analysis)
# Run these as individual commands (ensure you have IQTREE, Phynd, and Go 1.16 installed)

### IMPORTANT NOTE: Make sure your version of Go is 1.16 or lower to use phynd
### (If you use the updated version, the bp command gets killed randomly)

##################################################
# DISTANTLY RELATED SPECIES #
##################################################

#### gyrA Gene ####

GYRA_PATH="./intragenic_conflict/diverse/gyrA/subset_gyrA_cds_all_bacteria_conserved.fasta"
GYRA_ALIGN_PATH="./intragenic_conflict/diverse/gyrA/subset_gyrA_aligned.fasta"
GYRA_TRIMMED_PATH="./intragenic_conflict/diverse/gyrA/subset_gyrA_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$GYRA_PATH" > "$GYRA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$GYRA_ALIGN_PATH" -out "$GYRA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$GYRA_TRIMMED_PATH" -w 1000 -i 100 -t 2 -p

#### bla Gene ####

BLA_PATH="./intragenic_conflict/diverse/bla/bla_cds_all_bacteria.fasta"
BLA_ALIGN_PATH="./intragenic_conflict/diverse/bla/bla_aligned.fasta"
BLA_TRIMMED_PATH="./intragenic_conflict/diverse/bla/bla_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$BLA_PATH" > "$BLA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$BLA_ALIGN_PATH" -out "$BLA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$BLA_TRIMMED_PATH" -w 400 -i 100 -t 2 -p

#### 16S Gene ####

RRNA_PATH="./intragenic_conflict/diverse/16S/subset_16s_rRNA_all_bacteria_conserved.fasta"
RRNA_ALIGN_PATH="./intragenic_conflict/diverse/16S/subset_16s_aligned.fasta"
RRNA_TRIMMED_PATH="./intragenic_conflict/diverse/16S/subset_16S_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$RRNA_PATH" > "$RRNA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$RRNA_ALIGN_PATH" -out "$RRNA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$RRNA_TRIMMED_PATH" -w 1000 -i 100 -t 2 -p

#### rpoD Gene ####

RPOD_PATH="./intragenic_conflict/diverse/rpoD/rpoD_cds_all_bacteria.fasta"
RPOD_ALIGN_PATH="./intragenic_conflict/diverse/rpoD/rpoD_aligned.fasta"
RPOD_TRIMMED_PATH="./intragenic_conflict/diverse/rpoD/rpoD_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$RPOD_PATH" > "$RPOD_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$RPOD_ALIGN_PATH" -out "$RPOD_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$RPOD_TRIMMED_PATH" -w 500 -i 100 -t 2 -p

#### recA Gene ####
RECA_PATH="./intragenic_conflict/diverse/recA/recA_cds_all_bacteria.fasta"
RECA_ALIGN_PATH="./intragenic_conflict/diverse/recA/recA_aligned.fasta"
RECA_TRIMMED_PATH="./intragenic_conflict/diverse/recA/recA_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$RECA_PATH" > "$RECA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$RECA_ALIGN_PATH" -out "$RECA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$RECA_TRIMMED_PATH" -w 500 -i 100 -t 2 -p


##################################################
# RELATED SPECIES #
##################################################

#### gyrA Gene (related species) ####

GYRA_PATH="./intragenic_conflict/related/gyrA/gyrA_cds_all_bacteria.fasta"
GYRA_ALIGN_PATH="./intragenic_conflict/related/gyrA/gyrA_aligned.fasta"
GYRA_TRIMMED_PATH="./intragenic_conflict/related/gyrA/gyrA_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$GYRA_PATH" > "$GYRA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$GYRA_ALIGN_PATH" -out "$GYRA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$GYRA_TRIMMED_PATH" -w 1000 -i 100 -t 2 -p

#### rpoD Gene (related species) ####

RPOD_PATH="./intragenic_conflict/related/rpoD/rpoD_cds_all_bacteria.fasta"
RPOD_ALIGN_PATH="./intragenic_conflict/related/rpoD/rpoD_aligned.fasta"
RPOD_TRIMMED_PATH="./intragenic_conflict/related/rpoD/rpoD_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$RPOD_PATH" > "$RPOD_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$RPOD_ALIGN_PATH" -out "$RPOD_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$RPOD_TRIMMED_PATH" -w 1000 -i 100 -t 2 -p

#### bla Gene ####

BLA_PATH="./intragenic_conflict/related/bla/bla_cds_all_bacteria.fasta"
BLA_ALIGN_PATH="./intragenic_conflict/related/bla/bla_aligned.fasta"
BLA_TRIMMED_PATH="./intragenic_conflict/related/bla/bla_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$BLA_PATH" > "$BLA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$BLA_ALIGN_PATH" -out "$BLA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$BLA_TRIMMED_PATH" -w 400 -i 100 -t 2 -p

#### recA Gene ####
RECA_PATH="./intragenic_conflict/related/recA/recA_cds_all_bacteria.fasta"
RECA_ALIGN_PATH="./intragenic_conflict/related/recA/recA_aligned.fasta"
RECA_TRIMMED_PATH="./intragenic_conflict/related/recA/recA_aligned_trimmed.fasta"
PHYND_PATH="./phynd/src/phynd.py"

# activate conda env
conda activate phylo

# perform alignment
mafft --auto "$RECA_PATH" > "$RECA_ALIGN_PATH"

# install trimal to remove poor sequence mappings
#conda install bioconda::trimal
trimal -in "$RECA_ALIGN_PATH" -out "$RECA_TRIMMED_PATH" -automated1

# run conflict analysis w plot (sliding window)
"$PHYND_PATH" -s "$RECA_TRIMMED_PATH" -w 500 -i 100 -t 2 -p
