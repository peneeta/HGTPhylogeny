# HGT Phylogeny
Course Project for Fundamentals of Bioinformatics @ CMU\
*Amanda Qi and Peneeta Wojcik*

---------------------------

## Project Description
The objective of this work is to detect and interpret tree topology conflicts in both gene segment and full gene transfer events to resolve the evolutionary histories of bacterial species. We include analyses for intragenic conflict and code used to query the NCBI Entrez database. 


## Files
### [Data directory](Data)
Contains bacterial metadata, 16S, and gyrA fasta sequences (rpoD is present also but was not used in the analysis). The subset 16S and gyrA are paired - they contain the same species in both files for phylogenetic tree comparisons.
### [query_entrez.ipynb](query_entrez.ipynb) and [query_16S.ipynb](query_16S.ipynb)
Queries used to obtain sequences from the NCBI database.
### [intragenic_conflict directory](intragenic_conflict) 
Contains the treefiles constructed using a sliding window approach described in Smith et al. (https://academic.oup.com/mbe/article/37/11/3380/5870841). Shell commands used to generate these outputs are provided in [intragenic_conflict.sh](intragenic_conflict.sh). Folder also contains the plotted heatmaps and phylogenetic trees visualized using IToL, along with the annotation files used to generate the color-annotated trees. 
