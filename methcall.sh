#!/bin/bash

prefix=201106_arabidopsis
datadir=/dilithium/Data/Nanopore/projects/arabadopsis/$prefix

scratchdir=~/data/201106_arabidopsis
fast5dir=$scratchdir/20201106_arabidopsis/20201106_2138_X3_FAO43122_b5cb1b82/fast5_pass

ref=/mithril/Data/NGS/Reference/arab/TAIR10.fa
refmmi=/mithril/Data/NGS/Reference/arab/TAIR10.mmi

if [ $1 == guppy_rerio ] ; then
    mkdir $scratchdir/called
    guppy_basecaller \
	-i $fast5dir \
	-s $scratchdir/called \
	-d ~/software/rerio/basecall_models/ \
	-c res_dna_r941_min_modbases-all-context_v001.cfg \
	-x "cuda:0" \
	--fast5_out
    ##if u give config, u can't give kit/fcell
    
    ##move to dilithium
    mkdir -p $datadir/guppy_rerio
    mv $scratchdir/called $datadir/guppy_rerio
fi



