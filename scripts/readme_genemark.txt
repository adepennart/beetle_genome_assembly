
mkdir blastdb
cd blastdb
makeblastdb -in GCF_000648695.1_Otau_2.0_genomic.fna -out taurusNt -dbtype nucl
#will have to parse the busco output

#blast proteins
gunzip onthopagus_taurus/GCF_000648695.1_Otau_2.0_protein.faa.gz
makeblastdb -in onthopagus_taurus/GCF_000648695.1_Otau_2.0_protein.faa -out taurusAa -dbtype prot

blastp -query beetle_genes.faa -db ../../blastdb_prot/taurusAa -evalue 1e-10 -out lamarcki.blastp -num_descriptions 10 -num_alignments 5 -num_threads 20

Change in genemark output to genemark_ES

activate condo genemark

#interpro
Remove asterisk from sequences
Interpro...

FASTA-Reader: Ignoring invalid residues at position(s): On line 24648: 2
FASTA-Reader: Ignoring invalid residues at position(s): On line 87377: 13, 64
FASTA-Reader: Ignoring invalid residues at position(s): On line 87378: 5, 26
FASTA-Reader: Ignoring invalid residues at position(s): On line 87379: 17, 52-53, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 87380: 2, 26, 42, 66
FASTA-Reader: Ignoring invalid residues at position(s): On line 115656: 5, 12, 17, 29, 46, 67-68
FASTA-Reader: Ignoring invalid residues at position(s): On line 115657: 1, 13, 35, 40, 61
FASTA-Reader: Ignoring invalid residues at position(s): On line 115658: 36, 38, 57
FASTA-Reader: Ignoring invalid residues at position(s): On line 115659: 21
FASTA-Reader: Ignoring invalid residues at position(s): On line 115660: 9, 21, 32, 54
FASTA-Reader: Ignoring invalid residues at position(s): On line 115661: 16-17, 35, 46, 52
FASTA-Reader: Ignoring invalid residues at position(s): On line 115662: 10, 14, 21, 23, 49
FASTA-Reader: Ignoring invalid residues at position(s): On line 115663: 13, 21, 51, 61-62
FASTA-Reader: Ignoring invalid residues at position(s): On line 115664: 9, 15, 18, 21, 63
FASTA-Reader: Ignoring invalid residues at position(s): On line 115665: 4, 20
FASTA-Reader: Ignoring invalid residues at position(s): On line 195512: 24, 27, 32-33, 38, 47, 50, 66
FASTA-Reader: Ignoring invalid residues at position(s): On line 195513: 14, 24, 30, 34, 44-45, 47, 51, 53
FASTA-Reader: Ignoring invalid residues at position(s): On line 195514: 1, 5, 15, 24, 33, 49, 52, 58
FASTA-Reader: Ignoring invalid residues at position(s): On line 195515: 4, 6, 57, 62
FASTA-Reader: Ignoring invalid residues at position(s): On line 195516: 5, 13, 19, 36
FASTA-Reader: Ignoring invalid residues at position(s): On line 420870: 3, 6, 15, 23, 29, 31, 34-35
FASTA-Reader: Ignoring invalid residues at position(s): On line 420871: 2, 4, 13, 20, 22, 34, 53, 64
FASTA-Reader: Ignoring invalid residues at position(s): On line 420872: 10, 18, 33, 45-47, 54
FASTA-Reader: Ignoring invalid residues at position(s): On line 420873: 6-7, 10, 32, 59, 61, 64, 66
FASTA-Reader: Ignoring invalid residues at position(s): On line 420874: 2, 10, 27
FASTA-Reader: Ignoring invalid residues at position(s): On line 467728: 13, 31, 38, 44, 48
FASTA-Reader: Ignoring invalid residues at position(s): On line 467729: 8, 18, 28-29, 52, 59, 65
FASTA-Reader: Ignoring invalid residues at position(s): On line 467730: 1, 22, 33, 42, 46, 58, 61, 63
FASTA-Reader: Ignoring invalid residues at position(s): On line 467731: 3, 6, 15, 21, 24, 26, 32, 34, 37
FASTA-Reader: Ignoring invalid residues at position(s): On line 494386: 35, 37, 46, 53, 55, 67
FASTA-Reader: Ignoring invalid residues at position(s): On line 494387: 16, 27, 43, 51, 66
FASTA-Reader: Ignoring invalid residues at position(s): On line 494388: 8-10, 17, 39-40, 43, 65
FASTA-Reader: Ignoring invalid residues at position(s): On line 494389: 22, 24, 27, 29, 35, 43, 60
FASTA-Reader: Ignoring invalid residues at position(s): On line 494390: 1, 11, 13
FASTA-Reader: Ignoring invalid residues at position(s): On line 517467: 2, 12, 23, 46, 53, 59, 65
FASTA-Reader: Ignoring invalid residues at position(s): On line 517468: 16, 27, 36, 40, 52, 55, 57, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 517469: 9, 15, 18, 20, 26, 28, 31
FASTA-Reader: Ignoring invalid residues at position(s): On line 555959: 9-10, 48, 56
FASTA-Reader: Ignoring invalid residues at position(s): On line 555960: 24, 28
FASTA-Reader: Ignoring invalid residues at position(s): On line 558075: 38
FASTA-Reader: Ignoring invalid residues at position(s): On line 562243: 4, 46, 50, 53, 56, 59, 62
FASTA-Reader: Ignoring invalid residues at position(s): On line 562244: 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 562245: 3, 6, 9, 12, 36, 39, 42
FASTA-Reader: Ignoring invalid residues at position(s): On line 562248: 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47, 50, 53, 56, 59, 62, 65, 68
FASTA-Reader: Ignoring invalid residues at position(s): On line 562249: 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 562250: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 562251: 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47, 50, 53, 56, 59, 62, 65, 68
FASTA-Reader: Ignoring invalid residues at position(s): On line 562252: 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 562253: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 562254: 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47, 50, 53, 56, 59, 62, 65, 68
FASTA-Reader: Ignoring invalid residues at position(s): On line 562255: 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 67
FASTA-Reader: Ignoring invalid residues at position(s): On line 562256: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 562257: 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47, 50, 53, 56, 59, 62, 65, 68
FASTA-Reader: Ignoring invalid residues at position(s): On line 562258: 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 562259: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 562260: 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47, 50, 53, 56, 59, 62, 65, 68
FASTA-Reader: Ignoring invalid residues at position(s): On line 562261: 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 49, 52, 55, 58, 61, 64, 67, 70
FASTA-Reader: Ignoring invalid residues at position(s): On line 562262: 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69
FASTA-Reader: Ignoring invalid residues at position(s): On line 562263: 2, 5, 8, 11, 14, 20
