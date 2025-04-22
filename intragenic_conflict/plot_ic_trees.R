# Load required libraries
library(ape)
library(ggtree)
library(ggplot2)


plot_ggtree <- function(tree_obj, tree_title = "Related Species Phylogenetic Tree") {
  # Create base ggtree plot
  p <- ggtree(tree_obj, size = 0.6, branch.length="none")
  tree_data <- p$data  # Extract ggtree internal data
  
  # Add labels and formatting
  p <- p +
    geom_tiplab(size = 3, align = TRUE, linetype = "dotted", linesize = 0.3) +
    geom_text(data = subset(tree_data, !isTip & !is.na(label)),
              aes(x = x, y = y, label = label),
              hjust = -0.5, size = 2.5) +
    theme_tree2() +
    labs(title = tree_title) +
    theme(
      plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
      legend.position = "none"
    )
  
  # Extend x-axis to prevent clipping
  max_x <- max(tree_data$x, na.rm = TRUE)
  p <- p + xlim(0, max_x * 1.7)
  
  return(p)
}


####################################################################
# gyrA Gene
####################################################################

##### FULL GENE #####

# Read the tree
tree <- read.tree("./related/gyrA/gyrA_aligned_trimmed.fasta.treefile.sunk")
title = "Related Species Phylogenetic Tree for Full gyrA Gene"

# plot and save
p = plot_ggtree(tree, title)
ggsave("./conflicting_trees/gyrA_relatedSpecies_fullGene.png", plot = p, width = 10, height = 8, dpi = 300)


##### CONFLICTS #####


####################################################################
# bla Gene
####################################################################

##### FULL GENE #####

# Read the tree
tree <- read.tree("./related/bla/bla_aligned_trimmed.fasta.treefile.sunk")

title = "Related Species Phylogenetic Tree for Full bla Gene"

p = plot_ggtree(tree, title)
ggsave("./conflicting_trees/bla_relatedSpecies_fullGene.png", plot = p, width = 10, height = 8, dpi = 300)

