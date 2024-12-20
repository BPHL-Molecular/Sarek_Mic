# Sarek_Mic
## What to do
A modified version of **Sarek** (https://github.com/nf-core/sarek/tree/master) specifically for microorganisms. It uses multiple popular tools for SNP calling and annotation of microbial genomes.


![sarek-mic flow chart](https://github.com/user-attachments/assets/490711ed-fd33-4178-abad-966383e55ab6)

## Prerequisites
1. nf-core:
   https://nf-co.re/docs/nf-core-tools/installation
2. nextflow:
   https://nf-co.re/docs/usage/getting_started/installation
## Recommended environment installation and activation
```bash
conda create --name nf-core python=3.12 nf-core nextflow
conda activate nf-core
```
## How to run
### Unzip sarek.tar.gz
```bash
tar xvzf sarek.tar.gz
```
The folder "sarek" should be in the same directory with README.md, sbatch.sh, etc.
### OPtion1: SNP calling and annotation
1. Copy paired-end fastq files into the directory /data. 
2. Open the file "samplesheet.csv", and fill in the information of your samples. Each sample is in a line.
3. Open the file "params.yaml", and change the parameters ('fasta' and 'fasta_fai') of the reference path and its index path. 
4. Get to the top directory of the pipeline, run 
```bash
sbatch ./sbatch.sh
```
### Option2: only SNP annotation 
1. Copy snp-calling vcf files into the directory /data.
2. Add mapped bam and index files into the directory /data.
3. Rename the file "samplesheet.csv.ann" to "samplesheet.csv". Then open it and fill in the information about your samples. Each sample is in a line.
4. Open the file "params.yaml", and change the parameters ('fasta' and 'fasta_fai') of the reference path and its index path. And remove the comment mark in the line "#step: 'annotate'" 
5. get into the directory of the pipeline, run 
```bash
sbatch ./sbatch.sh
```
## What microorganisms can be analyzed by Sarek_Mic?
Any microorganism can be analyzed.      
Currently, only the reference genomes of *Candida auris, Mycobacterium tuberculosis*, and *SARS-CoV-2* are installed in the pipeline. If you want to analyze other microorganisms, please install the corresponding reference genome yourself, or open a new issue in the GitHub. We may update the corresponding reference genome for you.

