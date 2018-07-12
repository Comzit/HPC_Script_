#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -t 1-2
#$ -l mem_free=3G
#$ -l h_vmem=3G
#$ -l mem_token=3G
#$ -N STAR-ant
#Nicolas Descostes March 2018


# !!-----!! use the following submission command: qsub -pe threaded 1-20 alignment_STAR_PE_submission.sh INPUTFILE!!-----!!


 module load star/2.5.0c

#perl ./alignment_STAR_PE.pl $SGE_TASK_ID $1 $NSLOTS /ifs/home/descon01/programs/STAR_index/Hsal85
perl ./alignment_STAR_PE.pl $SGE_TASK_ID $1 $NSLOTS /ifs/home/co635/Ref/hg19_STAR_index

# qsub GENOMEINDEXPATH;FASTQFILE1;FASTQFILE2;LIMITNBMULTIREADS;OVERHANGUNANNOTATEDJUNCTION;OVERHANGANNOTATEDJUNCTION;MININTRONLENGTH;MAXINTRONLENGTH;OUTPUTFILENAMEPREFIX;QUALITYTHRESHOLD;NORMWIGGLE;READLENGTH;STRANDWIG
#GENOMEINDEXPATH: path to the files retrieved in b
#FASTQFILE1;FASTQFILE2: are in /media/reinbergShare/reinberglabspace/comzit/files_analysis_with_nico/fastq_chipseq_cutandrun
#LIMITNBMULTIREADS:1
#OVERHANGUNANNOTATEDJUNCTION: 3
#OVERHANGANNOTATEDJUNCTION: 3
#MININTRONLENGTH: 10
#MAXINTRONLENGTH: 1000000
#OUTPUTFILENAMEPREFIX
#QUALITYTHRESHOLD: 255
#NORMWIGGLE: "none"
#READLENGTH: 41
#STRANDWIG: "Unstranded"


#######INPUTFILE
# /ifs/home/co635/Ref/hg19_STAR_index/fastq/TE-2_S2_R1.fastq.gz;/ifs/home/co635/Ref/hg19_STAR_index/fastq/TE-2_S2_R2.fastq.gz;1;3;3;10;1000000;hg19_align;255;None;41;Unstranded;
#### getting human hg19 index star from http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/Genome
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/Homo_sapiens.GRCh38.83.gtf
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/Homo_sapiens.GRCh38.dna.primary_assembly.fa
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/Log.out
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/SA
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/SAindex
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/chrLength.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/chrName.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/chrNameLength.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/chrStart.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/exonGeTrInfo.tab
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/exonInfo.tab
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/geneInfo.tab
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/genomeParameters.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/log
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/sjdbInfo.txt
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/sjdbList.fromGTF.out.tab
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/sjdbList.out.tab
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-83/transcriptInfo.tab


#qsub -pe threaded 1-20 alignment_STAR_PE_submission_CO.sh INPUTFILE
