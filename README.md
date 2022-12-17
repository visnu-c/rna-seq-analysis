# RNA-Seq analysis 

## Access to Biomix 
`ssh -XC usernmae@biomix.dbi.udel.edu`

## To Biomix 
`scp /local/location/file.name.ext username@biomix.dbi.udel.edu:/target/folder`

## From Biomix 
`scp -r username@biomix.dbi.udel.edu:/target/file.name.ext /local/location`

## Quality check
`srun -c 9 --mem=8000 --x11 /usr/local/FastQC/fastqc --threads 9` to run FastQC in a graphical window 
- -c for CPU
- --x11 for graphical window 
- --threads for CPU threads

## Trimming 
- run trimming.slurm `sbatch trimming.slurm` whcih will use `trim_galore`
- check if the job running with `squeue`
- check if any errors or warnings `less slurm-123456.out`
- view trimming report `less rna_seq.s.fastq.gz_trimming_report.txt
- `less brain_a.s.fastq.gz_trimming_report.txt` to check trimming report 

## Mapping 
- `sbatch mapping.slurm` to map RNA-Seq data to human genome draft GRCh38
- `samtools view brain_a.s_trimmed.bam | less` to see the .bam file 

## Indexing 
- `srun -c 3 --mem 32000 --x11 /usr/local/IGV/igv.sh` to load indexed .bam file to IGV 

## Convertion 

## Indexing 

## Counting 

## Visualization and Analysis with R
R codes to do simple RNA seq data analysis after QC, trimming, mapping, soring, and counting the raw data in University of Delaware Biomix core. 
