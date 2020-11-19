#!/bin/bash

prefix=201106_arabidopsis
datadir=/dilithium/Data/Nanopore/projects/arabadopsis/$prefix


ref=/mithril/Data/NGS/Reference/arab/TAIR10.fa
refmmi=/mithril/Data/NGS/Reference/arab/TAIR10.mmi


if [ $1 == fastqs ] ; then
    ##gather all the fastq files into on
    mkdir -p $datadir/fqs
    
    cat $datadir/raw/fastq_pass/*fastq > $datadir/fqs/$prefix.fq
fi

fq=$datadir/fqs/$prefix.fq

if [ $1 == align ] ; then
    ##align the reads using minimap2, and the minimap reference
    mkdir -p $datadir/align

    minimap2 -ax map-ont -t 36 $refmmi $fq |
	samtools view -@ 36 -b |
	samtools sort -@ 36 -o $datadir/align/$prefix.sorted.bam
    samtools index $datadir/align/$prefix.sorted.bam
fi


