#! /bin/bash -l 
mkdir run
cd run
# gunzip pt_158_hifiasm20220817.bp.p_ctg.fasta.gz

#quality check
#quast
mkdir 0_quast
echo "quast section"
cd 0_quast/
ln -s ../../data/pt_158_hifiasm20220817.bp.p_ctg.fasta
python /sw/apps/bioinfo/quast/5.0.2/rackham/bin/quast.py  pt_158_hifiasm20220817.bp.p_ctg.fasta
#busco
cd ..
mkdir 1_busco
echo "busco section"
cd 1_busco/
ln -s ../../data/pt_158_hifiasm20220817.bp.p_ctg.fasta 
busco.py -i  pt_158_hifiasm20220817.bp.p_ctg.fasta -l $BUSCO_LINEAGE_SETS/endopterygota_odb10 -o busco_output -m genome

#masking = repeat masker?
cd ..
mkdir 0_mask
echo "mask section"
cd 0_mask
ln -s ../../data/pt_158_hifiasm20220817.bp.p_ctg.fasta
nohup RepeatMasker -species tribolium -pa 40 -dir .  pt_158_hifiasm20220817.bp.p_ctg.fasta 

#gene_prediction
cd ..
mkdir 1_genemark
echo "genemark section"
cd 1_genemark
ln -s ../0_mask/pt_158_hifiasm20220817.bp.p_ctg.fasta.masked
#masking = repeat masker?
#max and min contig
nohup gmes_petap.pl --ES --cores 40 --sequence  pt_158_hifiasm20220817.bp.p_ctg.fasta.masked

#gff_parse
cd ..
mkdir 2_gffread
echo "parse section"
cd 2_gffread
ln -s ../1_genemark/genemark.gtf 
ln -s ../../data/pt_158_hifiasm20220817.bp.p_ctg.fasta
#ensure no spaces in contig name
gffread -S -y parsed_lamarcki.faa -g pt_158_hifiasm20220817.bp.p_ctg.fasta genemark.gtf 

#make blast_db
cd ..
mkdir blastdb
echo "makedb section"
cd blastdb
ln -s ../../data/CX_prot.faa
#make database
makeblastdb -in CX_prot.faa  -out CX.Aa -dbtype prot

#blast
cd ..
mkdir 3_blast
echo "blast section"
cd 3_blast
ln -s ../2_gffread/parsed_lamarcki.faa
# -evalue 1e-10
#blast against beetle database
blastp -query parsed_lamarcki.faa -db ../blastdb/CX.Aa -out CX.blastp -num_threads 40