# beetle_genome_assembly
## About
script for finding central complex(CX) genes of interest in K. lamarcki genome.

This program is fully run on the terminal.

## Installation
The code can be directly installed from github (green Code button, top right).

Make sure to change into the downloaded directory, the code should resemble something like this.
```bash=
cd Downloads/beetle_genome_assembly
```
### Conda environment
First make sure conda is installed. If you do not have conda, refer to online resources on how to install conda.
https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html

Once installed, we can make a conda environment.

```bash=
#create new
conda create --name beetle_genome
#activate
conda activate beetle_genome
```

### Dependencies
The script runs with busco==5.3.1, quast==5.0.2, RepeatMasker==4.1.2-p1, genemark==4.71_lic, gffread==v0.12.7., blast==2.13.0+

Update your dependencies, if you do not already have the versions for these dependencies. You will need to install the conda-forge and bioconda channels on conda before installing the dependent softwares.
```bash=
#install channels
conda config --add channels conda-forge bioconda
#install dependencies
conda install busco==5.3.1, quast==5.0.2, RepeatMasker==4.1.2-p1, genemark==4.71_lic, gffread==v0.12.7., blast==2.13.0+

```

## Known Error
gffread not working in conda environment

## Usage

a bash script will be used to produce the blast output file, but firstly the script needs to be activated.
```bash=
#activate the bash script
chmod +x genemark.sh
```

The script should be all ready to run.
```bash=
./genemark.sh
```
### Input

2 input files are used for this code.

-the combined haplotype fna file (pt_158_hifiasm20220817.bp.p_ctg.fasta)

-the CX fruit fly faa file (CX_prot.faa)

### output

1 output file will be created.

-the blastp best matches against the CX protein file (CX.blastp)

