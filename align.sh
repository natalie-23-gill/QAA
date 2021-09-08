#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=align_mus  ### Job Name
#SBATCH --output=align_mus_%j.out         ### File in which to store job output
#SBATCH --error=align_mus_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8     ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission
conda activate QAA

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn   /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_1_paired.fq.gz /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_2_paired.fq.gz\
 --genomeDir /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus_musculus.GRCm39.ens104.STAR_2.7.9a \
 --outFileNamePrefix 3_2B_control_Mus_align/3_2B_control_Mus_align_

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn   /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_1_paired.fq.gz /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_2_paired.fq.gz\
 --genomeDir /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus_musculus.GRCm39.ens104.STAR_2.7.9a \
 --outFileNamePrefix 32_4G_both_Mus_align/32_4G_both_Mus_align_


