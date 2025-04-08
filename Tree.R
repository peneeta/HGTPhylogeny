library(ape)
library(ggtree)

tree <- read.tree("trimmed_bla.fasta.treefile")
p <- ggtree(tree, color="steelblue", size=0.8) + geom_tiplab(fontsize=3)
print(p)

library(ape)
library(phangorn)
library(ggtree)

# Read the trees
tree1 <- read.tree("trimmed_file1.fasta.treefile")
p <- ggtree(tree1, color="steelblue", size=0.8) + geom_tiplab(fontsize=3)
print(p)

tree2 <- read.tree("trimmed_file2.fasta.treefile")
q <- ggtree(tree2, color="steelblue", size=0.8) + geom_tiplab(fontsize=3)
print(q)

tree1$tip.label <- sub("_16s$", "", tree1$tip.label)
tree2$tip.label <- sub("_bla$", "", tree2$tip.label)

# Compute unweighted Robinson-Foulds distance
RF.dist(tree1, tree2)