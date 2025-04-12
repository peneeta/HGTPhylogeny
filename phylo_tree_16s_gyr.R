#install.packages("ape")
#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("msa")
install.packages("babette")


library(ape)
library(msa)
setwd("~/go/bioinformatics/Project")


# Use readDNAStringSet from Biostrings
alignment_path = "./HGTPhylogeny/Data/subset_gyrA_cds_all_bacteria_conserved.fasta"
dna_sequences <- readDNAStringSet(alignment_path)

aligned <- msa(dna_sequences)
aligned_dnabin <- as.DNAbin(aligned)

# Save the aligned sequences
write.nexus.data(as.character(aligned_dnabin),
                 file = "test_aligned.nex",
                 format = "dna")


distance_matrix <- dist.dna(aligned_dnabin, model = "raw")
njs_tree <- nj(distance_matrix)
write.tree(njs_tree, file = "test_nj_tree_silva.nwk")

# Open the PNG device
png(filename = "my_phylogenetic_tree.png", res = 150)

# Create your plot (with any desired customizations)
plot(njs_tree, cex = 0.7, label.offset = 0.2)
title("Phylogenetic Tree") # Add a title if you want

# Close the graphics device
dev.off()



  