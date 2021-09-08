#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=mapped_count   ### Job Name
#SBATCH --output=mapped_count_%j.out         ### File in which to store job output
#SBATCH --error=mapped_count_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8     ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission


/usr/bin/time -v python3 ./mapped_count.py -f /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/3_2B_control_Mus_align/3_2B_control_Mus_align_Aligned.out.sam \
-o 3_2B_control_mapped_stats.txt

/usr/bin/time -v python3 ./mapped_count.py -f /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/32_4G_both_Mus_align/32_4G_both_Mus_align_Aligned.out.sam \
-o 32_4G_both_mapped_stats.txt