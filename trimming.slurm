#!/bin/bash
#SBATCH --job-name=trimming
#SBATCH --mem=16000
#SBATCH -c 4

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E 'say"="x80'

cd /work/binf694/project_1/results/person

#SOFTWARE REQUIREMENTS

#VARIABLES - ran individually 
INFILE=/work/binf694/project_1/raw_data/cerebralcortex/brain_a.s.fastq.gz

# COMMAND(s) TO RUN
trim_galore --length 50 --quality 28 ${INFILE}


#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'
