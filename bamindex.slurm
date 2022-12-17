#!/bin/bash
#SBATCH --job-name=bamindex
#SBATCH --mem=64000
#SBATCH -c 32

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E>

cd ~/exercises

#SOFTWARE REQUIREMENTS

#VARIABLES
INFILE=/home/pritom/exercises/brain_a.s_trimmed.bam
PREFIX=`basename -s ".bam" ${INFILE}`

# COMMAND(s) TO RUN
# THIS COMMAND HAS A SLIGHTLY UPDATED SYNTAX DUE TO A SOFTWARE UPDATE
samtools sort -@ 32 -m 3750M -o ${PREFIX}.sorted.bam ${INFILE}
samtools index ${PREFIX}.sorted.bam

#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'

