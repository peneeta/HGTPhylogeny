#install.packages("ape")
#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
install.packages("babette")

#BiocManager::install("msa")

library(ape)
library(msa)
setwd("~/go/bioinformatics/Project")


# Use readDNAStringSet from Biostrings
alignment_path = "./HGTPhylogeny/Data/rpoD_cds_all_bacteria.fasta"
dna_sequences <- readDNAStringSet(alignment_path)

aligned <- msa(dna_sequences)
aligned_dnabin <- as.DNAbin(aligned)

# Save the aligned sequences
write.nexus.data(as.character(aligned_dnabin),
                 file = "test_aligned.nex",
                 format = "dna")


# "raw" is p-distance, other models available ERR - what did I download??
distance_matrix <- dist.dna(aligned_dnabin, model = "raw")
njs_tree <- nj(distance_matrix)

plot(nj_tree)

write.tree(nj_tree, file = "test_nj_tree_silva.nwk")


library(babette)

alignment_path <- "./test_aligned.nex"
alignment <- read.nexus.data(alignment_path)

model <- create_inference_model(
  alignment = alignment, 
  clock_model = "strict",
  partition_model = "fixed",
  prior_model = "gamma",
  MCMC = list(
    length = 1000000,
    iterations_per_tree = 1000))
  
# Run Bayesian inference
result <- bbt_run_from_model(model)

# Extract the optimal tree
bayes_tree <- extract_tree(result)

# Calculate branch posterior probabilities
#branch_probs <- calculate_branch_probs(result)

plot(bayes_tree)


  