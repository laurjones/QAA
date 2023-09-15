#!/bin/bash

#SBATCH --time=4:00:00
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --mail-user=syha@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R1_paired.trim.fastq.gz /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R2_paired.trim.fastq.gz \
--genomeDir /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/database \
--outFileNamePrefix Aligned_16_3D_

# /usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
# --outFilterMultimapNmax 3 \
# --outSAMunmapped Within KeepPairs \
# --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
# --readFilesCommand zcat \
# --readFilesIn /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/4_2C_R1_paired.trim.fastq.gz /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/4_2C_R2_paired.trim.fastq.gz \
# --genomeDir /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/database \
# --outFileNamePrefix Aligned_4_2C_

