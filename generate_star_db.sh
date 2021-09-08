#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=genome_generate   ### Job Name
#SBATCH --output=genome_generate_%j.out         ### File in which to store job output
#SBATCH --error=genome_generate_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:01:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1              ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=8     ### Number of tasks to be launched per node
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

/usr/bin/time -v STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./Mus_musculus.GRCm39.ens104.STAR_2.7.9a \
--genomeFastaFiles /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.dna_sm.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/nelphick/bioinfo/Bi623/Assignments/QAA/Mus/Mus_musculus.GRCm39.104.gtf


