## This repository details the bioinformatic pipelines used to identify the species specific SNPs in Triturus samples

#### The following software was employed for this study:

Perl	v3.38.0  
BBtools v38.96  
Trimmomatic	v0.39  
SAMtools	v1.18  
GATK	v4.5.0.0  
VCFtools	v0.1.16  
BCFtools	v1.18  

## Step 1: VCF files were generated from the raw fastq data via with the Pipeline_1.pl script, which calls Trimmomatic, BBtools, SAMtools and GATK.

This script also require the reference file: triturus.mod.RBBH.fasta, and list of adaptor sequences for trimming: TruSeq2-PE_trimmomatic.fa

``` perl ~/WielstraLab/Pipeline/Pipeline_1.pl -d "/data1/francejm/Willem" -t "_L00" -b "/home/francejm/BB/bbmap" -c -v -p 2 ```

## Step 2: The consensus.sh script was employed on the VCF files resuling from step 1 to create consensus sequences for each sample

## Step 3: The consensus sequences were then aggregated per species and manually processed to identify suitable SNPs 