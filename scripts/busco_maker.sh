#! /bin/bash -l

#SBATCH -p node -n 1 
#SBATCH -t 1-00:00:00 
#SBATCH -A naiss2023-22-103
#SBATCH -J beetle_busco 

# Variables used
BUSCO_DIR=/proj/beetle-23-458/Auguste/results/4_BUSCO_maker
genome=/proj/beetle-23-458/Auguste/results/3_maker/lamarcki_maker_protein1.faa

cd $BUSCO_DIR

#run with this
#sbatch server.sh

#-p devcore -n 1
# -p devel 
echo $(date +%s)
echo $(date +%s) > timefile_busco.txt


module load bioinfo-tools
module load BUSCO/5.3.1
source $AUGUSTUS_CONFIG_COPY

echo "modules loaded and Augustus dir copied"

## cp onthopagus_taurus/GCF_000648695.1_Otau_2.0_genomic.fna.gz beetle_busco_da/
## cd beetle_busco_da

## echo "copied files to directory beetle_busco_da"

#busco
##mkdir -p 1_busco_da
## cp pt_158_hifiasm20220817.bp.p_ctg.fasta.gz 1_busco_da/
## cd 1_busco_da/
run_BUSCO.py -i $genome -l $BUSCO_LINEAGE_SETS/endopterygota_odb10 -o busco_output -m proteins -c 20
echo "busco, quality control done"
cd ..
echo $(date +%s)
echo $(date +%s) >> timefile_busco.txt
#gene pred/gene annotation
