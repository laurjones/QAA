#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --mail-user=lmjone@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=10                #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --nodes=1                        #optional: number of nodes

conda activate QAA

trimmomatic PE -threads 10 -phred33 /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R1_out.fastq /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R2_out.fastq /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R1_paired.trim.fastq.gz /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R1_unpaired.trim.fastq.gz /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R2_paired.trim.fastq.gz /projects/bgmp/lmjone/bioinfo/Bi623/QAA/QAA/16_3D_R2_unpaired.trim.fastq.gz SLIDINGWINDOW:5:15 MINLEN:35 LEADING:3 TRAILING:3