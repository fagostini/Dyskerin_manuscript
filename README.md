# Dyskerin_manuscript

Code Repository for the Data Analyses of Co-Transcriptional Pseudouridylation 

## Required software and packages

In order to succesfully execute the code in this repository, the following tools are needed:

- [deepTools](https://deeptools.readthedocs.io/en/develop/index.html)
- [SparK](https://github.com/harbourlab/SparK)
- [R](https://www.r-project.org/) >= 4.1.0
- R packages (available via [Bioconductor](https://bioconductor.org/)): 
  - GenomicFeatures
  - GenomeInfoDb
  - data.table
  - ggpubr
  - ggsci
  - scales
  - ggthemes
  - tximport
  - DESeq2
  - IHW
  - org.Hs.eg.db
  - UpSetR
  - GGally
  - outliers

## Preliminary actions

### Obtain the required script and files

Dowload or clone the repository and move to the working directory:
```
cd Dyskerin_manuscript
```

### Prepare the inputs

Download the [Gencode v27](https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_27/gencode.v27.annotation.gff3.gz) annotation file (`GFF3` format), rename it `gencode.v27.annotation.gff3.gz`, and place it into `data/Annotation`.

Generate the RepeatMasker annotation (`TSV` format) by using the [TableBrowser](https://genome.ucsc.edu/cgi-bin/hgTables), rename it `hg38_repeatMasker.tsv.gz`, and place it into `data/Annotation`.

Some of the files that are employed by the script were too large to be uploaded on this repository and, therefore, they have to be either retrieved from the GEO repository or generated (_e.g._ mapped `BAM` files, normalised `BigWig` coverage files, _etc._), before being read into R.

#### [IMPORTANT] Define local paths

In the main [R markdown file](datA_analysis.Rmd), which contains the procedure on the majority of the analysis and visualisations, there are comments marked as __USER_ACTION__; these define sections/statements that have to be changed/modified by the user in order to locate and import the files required for these steps. Briefly, these include the RepeatMasker annotation, the Salmon quantification paths, and the BAM files for the different datasets.

### Genomic coverage profiles

All genomic coverage profiles were generated using [SparK](https://github.com/harbourlab/SparK) (see [createGenomicPlots.sh](createGenomicPlots.sh) script for procedure).

### Genomic metadata profiles

Genome coverage normalisations and genomic metadate matrices were generated using [deepTools](https://deeptools.readthedocs.io/en/develop/index.html) (see [createNormalisedTracks.sh](createNormalisedTracks.sh) and [createMatrixPlots.sh](createMatrixPlots.sh) scripts for procedure). The metadata matrices were imported into R and plotted.
