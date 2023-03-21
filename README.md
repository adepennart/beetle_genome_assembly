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
The script runs with busco==BUSCO/5.3.1, quast==5.0.2, RepeatMasker==4.1.2-p1, genemark==4.71_lic, gffread==v0.12.7., blast==2.13.0+

Update your dependencies, if you do not already have the versions for these dependencies. You will need to install the conda-forge and bioconda channels on conda before installing the dependent softwares.
```bash=
#install channels
conda config --add channels conda-forge bioconda
#install dependencies
conda install busco==BUSCO/5.3.1, quast==5.0.2, RepeatMasker==4.1.2-p1, genemark==4.71_lic, gffread==v0.12.7., blast==2.13.0+

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

3 input files are used for this code, each with a example file provided.

-combined_haplotype.fna file

-first_haplotype.fna file

-onthophagus_genome.fna file

-navigation.faa file

DATA_TEST, is the actual datasheet, the first column is the sample number (1,2,...,n), the second column specifies the 'before condition (1)' and the 'after condition (2)' and the remaining columns are for the exit angles(0,355).

DATE, is the day of the year, needed to correct the azimuth changes in a day accurately. The first column is the sample number (1,2,...,n), the second column specifies the 'before condition (1)' and the 'after condition (2)' and the remaining columns are for the dates(1-30). 

TIME, is the time of day, needed when correcting for azimuth changes through a day. The first column is the sample number (1,2,...,n), the second column specifies the 'before condition (1)' and the 'after condition (2)' and the remaining columns are for the times(ie. 13:44). If running indoor experiments, or where azimuth is not changing, write the same time for the 'before' and 'after' condition.

### output

2 types of output files will be created in the INPUT_OUTPUT folder.

-busco_outputfile.blastp

AZI_DATAFRAME, has 7 columns. The first column has the sample names, the second column has the mean vector length, the third has the difference in mean bearing, the fourth has the standard deviation value, the fifth has the angular deviation value, the sixth has the rayleigh test and the seventh has the sample size.

PLOTS, are the circular plots showing difference in mean bearing with the appropriate angular deviation and mean vector. All sample points will be seen as dots on the circle.
