#!/usr/bin/env bash

###### extract columns of interest, format and sort for LiftOver according to 0-based ######
zcat \
  summarystatistics_file.gz | \
  awk '{print $1,$3,$3+1,$2}' | \
  sed '1d' | \
  sort -g -k1 -k2 | \
  awk '{print "chr"$0}' \
  > 0-based_sorted_sst.bed

############ RUN LIFTOVER WITH '0-based_sorted_sst.bed' >> https://genome.ucsc.edu/cgi-bin/hgLiftOver ############

###### Rename liftover result and gzip it ######
mv hglft_genome_1011a_4f8700.bed hglft_genome_1011a_4f8700_hg38.bed

gzip hglft_genome_1011a_4f8700_hg38.bed

########## merge liftover result with summary stats in R using 'data.table' ###########

######### RUN THESE IN R #########

setwd("/Users/pheziwemshunqwane/Downloads")
install.packages("data.table")
library(data.table)
require(data.table)
install.packages('R.utils')

bed <- fread("hglft_genome_ASN_hg38.bed", header=F, col.names=c("CHR","START","END","SNP","1"), nThread=20)

mvp <- fread("daner_isgc_mvp_ASN_062821.neff.qc2.80.info0.6.gz", header=T, nThread=16)

bed.mvp <- merge.data.table(bed[,-c(1,3)], mvp, by="SNP", sort=F)

hdr <- sub("BP", "BP_hg19", names(bed.mvp))

hdr <- sub("START", "BP", hdr)

colnames(bed.mvp) <- hdr

fwrite(bed.mvp, "daner_isgc_mvp_ASN_062821.neff.qc2.80.info0.6_hg38.gz", col.names=T, row.names=F, quote=F, sep=" ", nThread=16, buffMB=100)


######### via command line: change the sst to a .txt and only extract the 5 required columns in order and change the delimiter to space  #########

awk '{printf "%s %s %s %s", $4, $2, $1, $6; for (i=7; i<=NF; i++) printf " %s", $i; printf "\n"}' sst_file.txt > working_sst.txt

sed 's/,/ /g' working_sst.txt > working_sst_delim.txt




