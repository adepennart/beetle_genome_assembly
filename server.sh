#! /bin/bash -l 
# 
#SBATCH -p node -N 10 -n 10 
#SBATCH -t 7-00:00:00 
#SBATCH -A p2010999 -J another_test 

#run with this
#sbatch server.sh


#-p devcore -n 1
# -p devel 

module load bioinfo-tools/version
module load quast/5.0.2 BUSCO/5.3.1 maker/3.01.04 
#GeneMark/4.69-es 

export OMP_NUM_THREADS=20
mpirun smart_aleck

#get onthopagus_taurus genome
#mkdir onthopagus_taurus
#cd onthopagus_taurus
#sftp or ftp like scp
#wget ftp://ncbi
#get *
#transfer files

#wget -i https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/648/695/GCF_000648695.1_Otau_2.0/

mkdir beetle_genome
cp pt_158_hifiasm20220817.bp.p_ctg.fasta.gz beetle_genome/
cd beetle_genome

#can put things on the scratch directory
#acces and unzip
gunzip pt_158_hifiasm20220817.bp.p_ctg.fasta.gz
cat pt_158_hifiasm20220817.bp.p_ctg.fasta | tr " " "_" > dash_beetle.fna
gunzip GCF_000648695.1_Otau_2.0_genomic.fna.gz
cat GCF_000648695.1_Otau_2.0_genomic.fna | tr " " "_" > dash_related_beetle.fna
#quality check
#quast
mkdir 0_quast
cp dash_beetle.fna 0_quast/
cd 0_quast/
python /sw/apps/bioinfo/quast/5.0.2/rackham/bin/quast.py dash_beetle.fna
#busco
cd ..
mkdir 1_busco
cp dash_beetle.fna 1_busco/
cd 1_busco/
busco.py -i dash_beetle.fna -l $BUSCO_LINEAGE_SETS/endopterygota_odb10 -o busco_output -m genome

#gene pred/gene annotation
cd ..
mkdir 2_maker
cp dash_beetle.fna 2_maker/
cp dash_related_beetle.fna 2_maker/
cd 2_maker
module load maker/3.01.04 perl/5.24.1 perl_modules/5.24.1
# module load perl/5.24.1 perl_modules/5.24.1
cp  -vf /sw/bioinfo/GeneMark/keyfile/gm_key  $HOME/.gm_key 
# module load RepeatMasker/4.1.2-p1÷ gffread/0.12.6 blast/2.12.0+

# #masking = repeat masker?
# mkdir 0_mask
# cp dash_beetle.fna 0_mask/
# cd 0_mask
# #mask function
# #not sure if pa(rralel) should be 5 or 20
# #max id length 50
# #make two files one with seqeunce and other with small headers then...
# #paste small_headers.fna sequence.fna | sed -n '1~2s/\t/\n/p' > small_head_genome.fna
# RepeatMasker -species drosophila -pa 5 dash_beetle.fna

#gene prediction
#do braker and do genemark and augustus
#chekc out genome threader-augustus
#or do maker with onlt protein
# GeneMark/4.38-es : A recent key file is needed to use this software and it must exist in your home directory. See 'module help GeneMark/4.38-es'
# augustus/3.4.0 : If you see errors about not being able to write to an augustus directory, see 'module help augustus/3.4.0'
# blast/2.7.1+ : the old-format NCBI blast databases are no longer updated after September 2019, use blast/2.9.0+ to search the latest NCBI databases
# Before running with mpirun, set the environment variable $LD_PRELOAD to
#     export LD_PRELOAD=$MPI_ROOT/lib/libmpi.so
# and include this option when using mpirun:
#     mpirun -mca btl ^openib ... maker ...
# If MPI support is not desired, load maker/3.01.2-beta instead

#maker has a repeat masker already
#cpus for blast
# MAKER also supports parallelization via MPI on computer clusters. Just
#      launch MAKER via mpiexec (i.e. mpiexec -n 40 maker). MPI support must be
#      configured during the MAKER installation process for this to work though
 
#  See 'module help GeneMark/4.38-es'
#  augustus/3.4.0 : If you see errors about not being able to write to an augustus directory, see 'module help augustus/3.4.0'
#  Before running with mpirun, set the environment variable $LD_PRELOAD to
#     export LD_PRELOAD=$MPI_ROOT/lib/libmpi.so
# and include this option when using mpirun:
#     mpirun -mca btl ^openib ... maker ...
#change config file to suit desired parameters
 maker -cpus maker_opts.ctl maker_bopts.ctl maker_exe.ctl 



# mkdir 1_genemark
# cp 0_mask/beetle_mask.fna 1_genemark/
# cd 1_genemark
# #masking = repeat masker?
# #max and min contig
# nohup gmes_petap.pl --ES --cores 20 --sequence beetle_mask.fna  &

# #gff_parse
# cd ..
# mkdir 2_gffread
# cp 1_genemark/genemark.gtf 2_gffread/
# cp 1_genemark/beetle_mask.fna 2_gffread/
# cd 2_gffread
# #ensure no spaces in contig name
# gffread -w beetle_genes.fna -g beetle_mask.fna genemark.gtf

# #blast
# cd ..
# mkdir 3_blast
# cp 2_gffread/beetle_genes.fna
# cd 3_blast
# # -evalue 1e-10
# #blast against beetle database
# blast -query beetle_genes.fna -db ../sw/data/blast_databases -out output.blast -num_threads 20