# Figure S2C
multiBamSummary BED-file -b './data/ChIPseq_data/ChIPseq_HCT_DKC1_None_1.dedup.sorted.bam' \
                            './data/ChIPseq_data/ChIPseq_HCT_DKC1_None_2.dedup.sorted.bam' \
                            './data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_None_1.dedup.sorted.bam' \
                            './data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_None_2.dedup.sorted.bam' \
                            -o protein_coding_summary --BED ./deepTools/protein_coding_genes.bed --labels "HCT-DKC1 rep1" "HCT-DKC1 rep2" "U2OS-DKC1 rep1" "U2OS-DKC1 rep2" --numberOfProcessors 4
plotCorrelation --corData protein_coding_summary --corMethod pearson --whatToPlot heatmap --plotNumbers --colorMap OrRd --outFileCorMatrix protein_coding_Pearson.tsv --plotFile protein_coding_heatmap_Pearson.svg --skipZeros
plotCorrelation --corData protein_coding_summary --corMethod spearman --whatToPlot heatmap --plotNumbers --colorMap OrRd --outFileCorMatrix protein_coding_Spearman.tsv --plotFile protein_coding_heatmap_Spearman.svg --skipZeros

# Figure 2A
computeMatrix scale-regions -S './deepTools/ChIPseq_U2OS_DKC1_None.bigwig'\
                            -R ./deepTools/protein_coding_expressed.bed --outFileName ChIP_Fig2A_matrix \
                            --regionBodyLength 2000 --upstream 2000 --downstream 2000 --binSize 10 \
                            --missingDataAsZero --skipZeros --samplesLabel "DKC1" --numberOfProcessors 4
plotProfile --matrixFile ChIP_Fig2A_matrix --outFileName ChIP_Fig2A.png --dpi 300 --outFileNameData ChIP_Fig2A.tsv --perGroup

# Figure 2F
computeMatrix scale-regions -S './deepTools/ChIPseq_U2OS_DKC1_None.bigwig' \
                               './deepTools/ChIPseq_U2OS_RNAPII_None.bigwig' \
                            -R ./deepTools/protein_coding_expressed.bed --outFileName ChIP_Fig2A_heatmap_matrix \
                            --sortRegions descend --sortUsing mean --sortUsingSamples 2 \
                            --regionBodyLength 2000 --upstream 2000 --downstream 2000 --binSize 20 \
                            --missingDataAsZero --skipZeros --samplesLabel "DKC1" "RNAPII" --numberOfProcessors 4
plotHeatmap --matrixFile ChIP_Fig2A_heatmap_matrix --outFileName ChIP_Fig2A_heatmap.png --dpi 300 --sortRegions keep --whatToShow 'heatmap and colorbar' --colorMap seismic --zMin -0.2 -2 --zMax 0.2 2

# Figure 2C
computeMatrix reference-point -S './deepTools/ChIPseq_U2OS_DKC1_None.bigwig' \
                                 './deepTools/ChIPseq_U2OS_RNAPII_None.bigwig' \
                                 './deepTools/ChIPseq_U2OS_DKC1_Flavopiridol.bigwig' \
                                 './deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol.bigwig' \
                            -R ./deepTools/protein_coding_expressed.bed --referencePoint TSS --outFileName ChIP_Fig2D_TSS_matrix \
                            --upstream 5000 --downstream 5000 --binSize 20 \
                            --missingDataAsZero --skipZeros \
                            --samplesLabel "DKC1 None" "RNAPII None" "DKC1 Flavo" "RNAPII Flavo" \
                            --numberOfProcessors 4
plotProfile --matrixFile ChIP_Fig2D_TSS_matrix --outFileName ChIP_Fig2D_TSS.png --dpi 300 --outFileNameData ChIP_Fig2D_TSS.tsv --perGroup

# Figure 2G
computeMatrix reference-point -S './deepTools/ChIPseq_U2OS_DKC1_None.bigwig' \
                               './deepTools/ChIPseq_HCT_DKC1_None.bigwig' \
                            -R ./deepTools/protein_coding_expQ_I.bed ./deepTools/protein_coding_expQ_II.bed ./deepTools/protein_coding_expQ_III.bed ./deepTools/protein_coding_expQ_IV.bed --referencePoint TES --outFileName ChIP_Fig2F_matrix \
                            --upstream 5000 --downstream 5000 --binSize 20 \
                            --missingDataAsZero --skipZeros --samplesLabel "DKC1 U2OS" "DKC1 HCT" \
                            --numberOfProcessors 4
plotProfile --matrixFile ChIP_Fig2F_matrix --outFileName ChIP_Fig2F.png --dpi 300 --outFileNameData ChIP_Fig2F.tsv --perGroup
