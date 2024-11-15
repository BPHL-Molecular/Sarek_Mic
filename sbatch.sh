#!/usr/bin/bash
#SBATCH --account=bphl-umbrella
#SBATCH --qos=bphl-umbrella
#SBATCH --job-name=sarek
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=50gb
#SBATCH --time=48:00:00
#SBATCH --output=sarek.%j.out
#SBATCH --error=sarek.err
#SBATCH --mail-user=<EMAIL>
#SBATCH --mail-type=FAIL,END

APPTAINER_CACHEDIR=./
export APPTAINER_CACHEDIR

#nextflow run nf-core/sarek -profile singularity --input ./samplesheet.csv --outdir ./output --tools 'haplotypecaller,snpeff'
#GRCh38
#nextflow run ./sarek -profile singularity --input ./samplesheet.csv --outdir ./output --tools 'freebayes,snpeff'

#hg38 ucsc from igenomes
#nextflow run ./sarek -profile singularity --input samplesheet.csv --outdir ./ --genome hg38 --tools 'freebayes,snpeff' --skip_tools baserecalibrator

# custom genomes
#nextflow run ./sarek -profile singularity --input samplesheet.csv --outdir ./ --tools 'freebayes' --genome null --igenomes_ignore --fasta ./ref/hs37d5.fa --skip_tools baserecalibrator
#nextflow run ./sarek -profile hs37d5,singularity --input samplesheet.csv --outdir ./ --tools 'freebayes,snpeff' --skip_tools baserecalibrator
#nextflow run ./sarek -profile singularity --input samplesheet.csv --outdir ./Candida --tools 'freebayes,snpeff' --genome null --igenomes_ignore --fasta ./ref/hs37d5.fa --skip_tools baserecalibrator --snpeff_cache /blue/bphl-florida/dongyibo/nf-core/sarek/candida_auris.5

#nextflow run ./sarek -profile singularity --input samplesheet.csv --outdir ./Candida --tools snpeff --step annotate --genome null --igenomes_ignore --skip_tools baserecalibrator --snpeff_cache /blue/bphl-florida/dongyibo/nf-core/sarek/data --snpeff_db _candida_aurisgca_001189475

#nextflow run ./sarek/main.nf -profile singularity --input ./samplesheet.csv --outdir results --tools snpeff --step annotate --genome null --igenomes_ignore --snpeff_cache /blue/bphl-florida/dongyibo/nf-core/sarek3/data/snpeff_cache --snpeff_db _candida_auris_gca_001189475
nextflow run ./sarek/main.nf -profile singularity -params-file params.yaml