# RNA-Seq analysis 

## Biomix 
- `ssh -XC usernmae@biomix.dbi.udel.edu` to log in
- `scp /local/location/file.name.ext username@biomix.dbi.udel.edu:/target/folder` to copy file to Biomix 
- `scp -r username@biomix.dbi.udel.edu:/target/file.name.ext /local/location` to copy file from Biomix to local folder 

## Quality check
`srun -c 9 --mem=8000 --x11 /usr/local/FastQC/fastqc --threads 9` to check RNA-Seq quality using `FastQC` in a graphical window 
- -c for CPU, --x11 for graphical window, --threads for CPU threads

## Trimming 
- `sbatch trimming.slurm` to trim off the adapter sequences using `trim_galore`
- `squeue` to check job status 
- `less slurm-123456.out` to check for any errors or warnings 
- `less brain_a.s.fastq.gz_trimming_report.txt` to check trimming report 

## Mapping 
- `sbatch mapping.slurm` to map RNA-Seq data to human genome draft GRCh38 using `hisat2`
- `samtools view brain_a.s_trimmed.bam | less` to see the .bam file 

## Indexing 
- `sbatch bamindex.slurm` uses `samtools` to index .bam files 

## Counting 
- `sbatch counting.slurm` uses `htseq-count` for countring 

## Visualization and Analysis with R
- Workflow: Import, filter, log transform, distance heatmap, PCA, gene heatmap, BCV plot, smear plot, and differential expression analysis 
- Codes are in the rscript 
