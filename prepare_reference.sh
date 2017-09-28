#!/bin/bash -eux

MY_DIR="/yt/disk1/ignat/biology"
BINOM="${MY_DIR}/binom"
REFERENCE="${MY_DIR}/hg38/hg38.fa"
PICARD="java -jar ${MY_DIR}/picard/dist/picard.jar"
#PICARD="java -jar ${MY_DIR}/picard-tools/picard.jar"
export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

rm "${MY_DIR}/hg38/hg38.dict"
$PICARD CreateSequenceDictionary R=${MY_DIR}/hg38/hg38.fa O=${MY_DIR}/hg38/hg38.dict

samtools faidx "${MY_DIR}/hg38/hg38.fa"
