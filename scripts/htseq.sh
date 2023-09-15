#!/bin/bash

#SBATCH --time=4:00:00
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --mail-user=lmjone@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB

conda activate QAA

/usr/bin/time -v htseq-count --stranded=yes Aligned_16_3D_Aligned.out.sam Mus_musculus.GRCm39.110.gtf > Aligned_yes_16_3D_out.tsv

/usr/bin/time -v htseq-count --stranded=yes Aligned_4_2C_Aligned.out.sam Mus_musculus.GRCm39.110.gtf > Aligned_yes_4_2C_out.tsv


/usr/bin/time -v htseq-count --stranded=reverse Aligned_16_3D_Aligned.out.sam Mus_musculus.GRCm39.110.gtf > Aligned_reverse_16_3D_out.tsv

/usr/bin/time -v htseq-count --stranded=reverse Aligned_4_2C_Aligned.out.sam Mus_musculus.GRCm39.110.gtf > Aligned_reverse_4_2C_out.tsv