#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=cut_adapt   ### Job Name
#SBATCH --output=cut_adapt_%j.out         ### File in which to store job output
#SBATCH --error=cut_adapt_%j.err          ### File in which to store job error messages
#SBATCH --time=0-12:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8    ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission



conda activate QAA

/usr/bin/time -v cutadapt -j 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/3_2B_control.1.fastq \
-p /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/3_2B_control.2.fastq \
/projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R2_001.fastq.gz 

/usr/bin/time -v cutadapt -j 8 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/32_4G_both.1.fastq \
-p /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Adapter_trimmed/32_4G_both.2.fastq \
/projects/bgmp/shared/2017_sequencing/demultiplexed/32_4G_both_S23_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/32_4G_both_S23_L008_R2_001.fastq.gz 
