#! /bin/bash -l 

#get onthopagus_taurus genome
#mkdir onthopagus_taurus
#cd onthopagus_taurus
#sftp or ftp like scp
#wget ftp://ncbi
#get *
#transfer files

#wget -i https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/648/695/GCF_000648695.1_Otau_2.0/

#mkdir beetle_genome
#cp pt_158_hifiasm20220817.bp.p_ctg.fasta beetle_genome/
#cd beetle_genome

# #can put things on the scratch directory
# #acces and unzip
# gunzip pt_158_hifiasm20220817.bp.p_ctg.fasta.gz
# cat pt_158_hifiasm20220817.bp.p_ctg.fasta | tr " " "_" > dash_beetle.fna

# #quality check
# #quast
# mkdir 0_quast
# cp dash_beetle.fna 0_quast/
# cd 0_quast/
# python /sw/apps/bioinfo/quast/5.0.2/rackham/bin/quast.py dash_beetle.fna
# #busco
# cd ..
# mkdir 1_busco
# cp dash_beetle.fna 1_busco/
# cd 1_busco/
# busco.py -i dash_beetle.fna -l $BUSCO_LINEAGE_SETS/endopterygota_odb10 -o busco_output -m genome

# #masking = repeat masker?
#mkdir 0_mask
#mv pt_158_hifiasm20220817.bp.p_ctg.fasta 0_mask/
#cd 0_mask
# #mask function
# #not sure if pa(rralel) should be 5 or 20
# #max id length 50
# #make two files one with seqeunce and other with small headers then...
# #paste small_headers.fna sequence.fna | sed -n '1~2s/\t/\n/p' > small_head_genome.fna
#conda activate genemark
#RepeatMasker -species tribolium -pa 40 -dir . pt_158_hifiasm20220817.bp.p_ctg.fasta  &

cd beetle_genome/
#mkdir 1_genemark
cp 0_mask/RM_1147431.WedFeb12020452023/pt_158_hifiasm20220817.bp.p_ctg.fasta 1_genemark/
cd 1_genemark
#masking = repeat masker?
#max and min contig
nohup gmes_petap.pl --ES --cores 40 --sequence pt_158_hifiasm20220817.bp.p_ctg.fasta &

#gff_parse
cd ..
#mkdir 2_gffread
ln -s 1_genemark/genemark.gtf 2_gffread/
ln -s 1_genemark/pt_158_hifiasm20220817.bp.p_ctg.fasta 2_gffread/
cd 2_gffread
#ensure no spaces in contig name
gffread -w beetle_genes.fna -g pt_158_hifiasm20220817.bp.p_ctg.fasta genemark.gtf 

#make blast_db

#blast
cd ..
#mkdir 3_blast
ln -s 2_gffread/beetle_genes.fna 3_blast taurusNt.ndb
cd 3_blast
# -evalue 1e-10
#blast against beetle database
blastp -query beetle_genes.faa -db ../../blastdb/taurusNt -out output.blastp -num_threads 40
 