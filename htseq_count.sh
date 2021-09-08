#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=htseq_count   ### Job Name
#SBATCH --output=htseq_count_%j.out         ### File in which to store job output
#SBATCH --error=htseq_count_%j.err          ### File in which to store job error messages
#SBATCH --time=0-12:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8    ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

/usr/bin/time -v htseq-count --stranded=yes \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/3_2B_control_Mus_align/3_2B_control_Mus_align_Aligned.out.sam \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.104.gtf > 3_2B_control_htseq_coun_stranded.txt

/usr/bin/time -v htseq-count --stranded=no \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/3_2B_control_Mus_align/3_2B_control_Mus_align_Aligned.out.sam \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.104.gtf > 3_2B_control_htseq_coun_unstranded.txt

/usr/bin/time -v htseq-count --stranded=yes \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/32_4G_both_Mus_align/32_4G_both_Mus_align_Aligned.out.sam \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.104.gtf > 32_4G_both_htseq_coun_stranded.txt

/usr/bin/time -v htseq-count --stranded=no \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/32_4G_both_Mus_align/32_4G_both_Mus_align_Aligned.out.sam \
/projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.104.gtf > 32_4G_both_htseq_coun_unstranded.txt