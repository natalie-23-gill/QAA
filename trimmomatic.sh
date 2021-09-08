#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=trimmomatic   ### Job Name
#SBATCH --output=trimmomatic_%j.out         ### File in which to store job output
#SBATCH --error=trimmomatic_%j.err          ### File in which to store job error messages
#SBATCH --time=0-12:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8    ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission


conda activate QAA

/usr/bin/time -v java -jar /projects/bgmp/nelphick/miniconda3/envs/QAA/share/trimmomatic/trimmomatic.jar \
PE -threads 8 \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/3_2B_control.1.fastq \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/3_2B_control.2.fastq \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_1_paired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_1_unpaired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_2_paired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/3_2B_control_2_unpaired.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


/usr/bin/time -v java -jar /projects/bgmp/nelphick/miniconda3/envs/QAA/share/trimmomatic/trimmomatic.jar \
PE -threads 8 \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/32_4G_both.1.fastq \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/32_4G_both.2.fastq \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_1_paired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_1_unpaired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_2_paired.fq.gz \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Quality_trimmed/32_4G_both_2_unpaired.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35