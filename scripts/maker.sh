#! /bin/bash -l

##SBATCH -p node -N 20 -n 20
##SBATCH -t 7-00:00:00 
#SBATCH -A naiss2023-22-103 -J beetle_maker 

#SBATCH -p devcore -n 1
# -p devel 
echo date +%s > timefile.txt
module load bioinfo-tools
#module load maker/3.01.04
module load maker/3.01.2-beta
#module unload snap

# mkdir beetle_genome/
# mv pt_158_hifiasm20220817.bp.p_ctg.fasta.gz beetle_genome/
# mv GCF_000648695.1_Otau_2.0_protein.faa.gz beetle_genome/
# mv test_* 2/maker
# cd beetle_genome/


#gene pred/gene annotation
# mkdir 2_maker
# mv pt_158_hifiasm20220817.bp.p_ctg.fasta.gz 2_maker/
# mv  GCF_000648695.1_Otau_2.0_protein.faa.gz 2_maker/
# mv test_* 2/maker
# cd 2_maker

#needed now?
#cp  -vf /sw/bioinfo/GeneMark/keyfile/gm_key  $HOME/.gm_key 
echo "ready for maker"
pwd
#maker -cpus 20 maker_opts.ctl maker_bopts.ctl maker_exe.ctl 
maker -cpus 20
echo "script complete"
echo date +%s >> timefile.txt
