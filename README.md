# Dyskerin manuscript

Code Repository for the Data Analyses of Co-Transcriptional Pseudouridylation 

## Requirements

In order to succesfully execute the code in this repository, the following software and packages are needed:

- [R](https://www.r-project.org/) >= 4.1.0
- R packages (available via [Bioconductor](https://bioconductor.org/)): 
  - Rsamtools
  - GenomicAlignments
  - GenomicFeatures
  - GenomeInfoDb
  - rtracklayer
  - data.table
  - ggpubr
  - cowplot
  - ggsci
  - scales
  - ggthemes
  - ggrepel
  - ggVennDiagram
  - viridis
  - tximport
  - DESeq2
  - IHW
  - org.Hs.eg.db
  - UpSetR
  - GGally
  - outliers
- [OPTIONAL] [deepTools](https://deeptools.readthedocs.io/en/develop/index.html)
- [OPTIONAL] [SparK](https://github.com/harbourlab/SparK)

## Preliminary actions

### Obtain the required script and files

Dowload or clone the repository and move to the working directory:
```
cd Dyskerin_manuscript
```

### [OPTIONAL] Setup a conda environment

To install Miniconda, a free minimal installer for conda, follow [these instructions](https://docs.conda.io/en/latest/miniconda.html).

Assuming that conda is available on the system, use the `environment.yml` file to generate a minimal working environment, comprising R and some basic packages

```bash
conda env create -f environment.yml
```

The installation of the additional pacakges has to be perfomed from within the newly generated environment:

```bash
conda activate dyskerin_manuscript
```

#### Install Bioconductor packages

Open an R session:
```bash
R
```

Install Bioconductor
```r
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.16")
```

Install missing packages
```r
BiocManager::install(c("GenomicFeatures", "GenomeInfoDb", "org.Hs.eg.db", "tximport", "DESeq2",  "IHW", "apeglm"))
```

### Prepare the inputs

Download the [Gencode v27](https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_27/gencode.v27.annotation.gff3.gz) annotation file (`GFF3` format), rename it `gencode.v27.annotation.gff3.gz`, and place it into `data/Annotation`.

Generate the RepeatMasker annotation (`TSV` format) by using the [TableBrowser](https://genome.ucsc.edu/cgi-bin/hgTables), rename it `hg38_repeatMasker.tsv.gz`, and place it into `data/Annotation`.

Some of the files that are employed by the script were too large to be uploaded on this repository and, therefore, they must be either retrieved from the GEO repository ([GSE211202](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE211202)) or generated (_e.g._ mapped `BAM` files, normalised `BigWig` coverage files, _etc._) before they can be read into R or deepTools.

> NOTE: The code can be executed even without BAM files, but some steps might not return the expected output. 

### [CRUCIAL] Define local paths

In the main [R markdown file](datA_analysis.Rmd), which contains the procedure on the majority of the analysis and visualisations, there are some headers marked as __USER_ACTION__; these define sections/statements that have to be changed/modified by the user in order to locate and import the files required for these steps. Briefly, these include the RepeatMasker annotation, the Salmon quantification paths, and the BAM files for the different datasets. For convenience, the [rosetta table](rosettaTable.tsv) file, which contains labels and paths to the required BAM files, is read into R; so, make sure to modify it according to your setup.

### Genomic coverage profiles

All genomic coverage profiles were generated using [SparK](https://github.com/harbourlab/SparK) (see [createGenomicPlots.sh](createGenomicPlots.sh) script for procedure).

### Genomic metadata profiles

Genome coverage normalisations and genomic metadata matrices were generated using [deepTools](https://deeptools.readthedocs.io/en/develop/index.html) (see [createNormalisedTracks.sh](createNormalisedTracks.sh) and [createMatrixPlots.sh](createMatrixPlots.sh) scripts for procedure). The metadata matrices were imported into R and plotted.
