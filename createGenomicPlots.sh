# Figure S4B
python3 /home/agostif/Documents/GitHub/SparK/SparK.py \
    -pr chr1:92840650-92840900 -gs "yes" -gtf './data/Annotation/gencode.v27.annotation.gtf' \
    --display_scalebar "yes" -sm 3 -ps averages -cs 500 500 1100 1100 \
    --control_files './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep2.fastq.gz' \
                    -cg 1 1 2 2 3 3 4 4 \
                    -gl "IgG-DKC1" "DKC1" "IgG-GAR1" "GAR1" \
                    --output_name GenomeShot_SNORA66

# Figure S4B
python3 /home/agostif/Documents/GitHub/SparK/SparK.py \
    -pr chr1:27834250-27834600 -gs "yes" -gtf './data/Annotation/gencode.v27.annotation.gtf' \
    --display_scalebar "yes" -sm 3 -ps averages -cs 50 50 600 600 \
    --control_files './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep2.fastq.gz' \
                    -cg 1 1 2 2 3 3 4 4 \
                    -gl "IgG-DKC1" "DKC1" "IgG-GAR1" "GAR1" \
                    --output_name GenomeShot_SCARNA1

# Figure 3D
python3 /home/agostif/Documents/GitHub/SparK/SparK.py \
    -pr chr7:5527000-5531000 -gs "yes" -gtf './data/Annotation/gencode.v27.annotation.gtf' \
    --display_scalebar "yes" -dg ACTB -sm 10 -ps averages -cs 2.75 2.75 0.91 0.91 \
    --control_files './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_Dyskerin_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_IgG-GAR1_rep2.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep1.fastq.gz' \
                    './data/CLIPseq_data/U2OS_iCLIP_GAR1_rep2.fastq.gz' \
                    -cg 1 1 2 2 3 3 4 4 \
                    -gl "IgG-DKC1" "DKC1" "IgG-GAR1" "GAR1" \
                    --output_name GenomeShot_ActB

# Figure 2B
for j in `ls deepTools | grep -e '_Flavopiridol_ratio.bigwig' -e '_None_ratio.bigwig'`; do
    bigWigToBedGraph -chrom=chr7 -start=5500000 -end=5600000 deepTools/$j ./data/ChIPseq_data/out
    awk '{print $1, $2, $3, $4-1}' ./data/ChIPseq_data/out | awk '{if($4<0){print $1, $2, $3, 0}else{print $0}}' | tr ' ' '\t' > ./data/ChIPseq_data/${j%%.bigwig}.bedGraph
done
python3 /home/agostif/Documents/GitHub/SparK/SparK.py \
    -pr chr7:5522000-5533000 -gtf './data/Annotation/gencode.v27.annotation.gtf' \
    --display_scalebar "yes" -sm 10 \
    --control_files './data/ChIPseq_data/ChIPseq_U2OS_DKC1_None_ratio.bedGraph' \
                    './data/ChIPseq_data/ChIPseq_U2OS_RNAPII_None_ratio.bedGraph' \
    --treat_files   './data/ChIPseq_data/ChIPseq_U2OS_DKC1_Flavopiridol_ratio.bedGraph' \
                    './data/ChIPseq_data/ChIPseq_U2OS_RNAPII_Flavopiridol_ratio.bedGraph' \
                    -cg 1 2 \
                    -tg 1 2 \
                    -l "Control" "Flavo" -gl "DKC1" "RNAPII" \
                    --output_name GenomeShot_Fig2B

# Figure S2D
for j in `ls deepTools | grep -e '_Flavopiridol_ratio.bigwig' -e '_None_ratio.bigwig'`; do
    bigWigToBedGraph -chrom=chr19 -start=17850000 -end=17880000 deepTools/$j ./data/ChIPseq_data/out
    awk '{print $1, $2, $3, $4-1}' ./data/ChIPseq_data/out | awk '{if($4<0){print $1, $2, $3, 0}else{print $0}}' | tr ' ' '\t' > ./data/ChIPseq_data/${j%%.bigwig}.bedGraph
done
python3 /home/agostif/Documents/GitHub/SparK/SparK.py \
    -pr chr19:17860000-17870000 -gtf './data/Annotation/gencode.v27.annotation.gtf' \
    --display_scalebar "yes" -sm 10 \
    --control_files './data/ChIPseq_data/ChIPseq_U2OS_DKC1_None_ratio.bedGraph' \
                    './data/ChIPseq_data/ChIPseq_U2OS_RNAPII_None_ratio.bedGraph' \
    --treat_files   './data/ChIPseq_data/ChIPseq_U2OS_DKC1_Flavopiridol_ratio.bedGraph' \
                    './data/ChIPseq_data/ChIPseq_U2OS_RNAPII_Flavopiridol_ratio.bedGraph' \
                    -cg 1 2 \
                    -tg 1 2 \
                    -l "Control" "Flavo" -gl "DKC1" "RNAPII" \
                    --output_name GenomeShot_FigS2A
