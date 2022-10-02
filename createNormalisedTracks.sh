echo HCT
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_HCT_DKC1_None_1.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_HCT_Input_None_1.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --numberOfProcessors 8 --outFileName ./deepTools/ChIPseq_HCT_DKC1_None_1.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_HCT_DKC1_None_2.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_HCT_Input_None_1.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --numberOfProcessors 8 --outFileName ./deepTools/ChIPseq_HCT_DKC1_None_2.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./deepTools/ChIPseq_HCT_DKC1_None_1.bigwig --bigwig2 ./deepTools/ChIPseq_HCT_DKC1_None_2.bigwig --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation mean --numberOfProcessors 8 --outFileName ./deepTools/ChIPseq_HCT_DKC1_None.bigwig --outFileFormat bigwig

echo DKC1
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_None_1.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_None_3.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_None_1_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_None_2.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_None_4.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_None_2_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./deepTools/ChIPseq_U2OS_DKC1_None_1_ratio.bigwig --bigwig2 ./deepTools/ChIPseq_U2OS_DKC1_None_2_ratio.bigwig --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation mean --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_None_ratio.bigwig --outFileFormat bigwig

echo RNAPII
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_RNAPII_None_1.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_None_3.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_None_1_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_RNAPII_None_2.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_None_4.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_None_2_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./deepTools/ChIPseq_U2OS_RNAPII_None_1_ratio.bigwig --bigwig2 ./deepTools/ChIPseq_U2OS_RNAPII_None_2_ratio.bigwig --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation mean --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_None_ratio.bigwig --outFileFormat bigwig

echo DKC1 Flavo
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_Flavopiridol_1.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_Flavopiridol_1.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_Flavopiridol_1_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_DKC1m04_Flavopiridol_2.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_Flavopiridol_2.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_Flavopiridol_2_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./deepTools/ChIPseq_U2OS_DKC1_Flavopiridol_1_ratio.bigwig --bigwig2 ./deepTools/ChIPseq_U2OS_DKC1_Flavopiridol_2_ratio.bigwig --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation mean --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_DKC1_Flavopiridol_ratio.bigwig --outFileFormat bigwig

echo RNAPII Flavo
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_RNAPII_Flavopiridol_3.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_Flavopiridol_1.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol_1_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./data/ChIPseq_data/ChIPseq_U2OS_RNAPII_Flavopiridol_4.dedup_mapq30_CPM.bw --bigwig2 ./data/ChIPseq_data/ChIPseq_U2OS_Input_Flavopiridol_2.dedup_mapq30_CPM.bw --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation ratio --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol_2_ratio.bigwig --outFileFormat bigwig
bigwigCompare --bigwig1 ./deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol_1_ratio.bigwig --bigwig2 ./deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol_2_ratio.bigwig --skipZeroOverZero --skipNonCoveredRegions --binSize 10 --operation mean --numberOfProcessors 40 --outFileName ./deepTools/ChIPseq_U2OS_RNAPII_Flavopiridol_ratio.bigwig --outFileFormat bigwig
