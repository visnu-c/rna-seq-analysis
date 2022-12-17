#!/bin/bash
#SBATCH --job-name=counting
#SBATCH --mem=32000
#SBATCH -c 1

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E>

cd /home/pritom/exercises/12-counting


#SOFTWARE REQUIREMENTS

#VARIABLES
INDIR=~/exercises/12-mapping                                                            # INPUT DIRECTORY
GFF=/work/binf694/project_1/reference/human-hisat2/grch38/Homo_sapiens.GRCh38.84.gtf    # ANNOTATION GTF FILE >
OUTDIR=~/exercises/12-counting                                                          # OUTPUT DIRECTORY

#COMMAND(s) TO RUN
# THIS LOOP WILL RUN THE INDENTED PART ON EACH FILE ENDING IN .bam IN THE INPUT DIRECTORY

for i in `ls -1 ${INDIR}/*.sorted.bam`
do
   echo "PROCESSING FILE: ${i}"
   PREFIX=`basename -s ".bam" ${i}`

   htseq-count --mode intersection-nonempty \
      --stranded no \
      --format bam \
      --type exon \
      --idattr gene_name \
      ${i} \
      ${GFF} \
      > ${OUTDIR}/${PREFIX}.count.txt
done


#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'

