#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=qscore_plot   ### Job Name
#SBATCH --output=qscore_plot_%j.out         ### File in which to store job output
#SBATCH --error=qscore_plot_%j.err          ### File in which to store job error messages
#SBATCH --time=0-12:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8    ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission

conda activate bgmp_py39

/usr/bin/time -v python3 ./qscore_plot.py -r1 /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz \
-r2 /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R2_001.fastq.gz \
-sn "3_2B_control"

/usr/bin/time -v python3 ./qscore_plot.py -r1 /projects/bgmp/shared/2017_sequencing/demultiplexed/32_4G_both_S23_L008_R1_001.fastq.gz \
-r2 /projects/bgmp/shared/2017_sequencing/demultiplexed/32_4G_both_S23_L008_R2_001.fastq.gz \
-sn "32_4G_both"