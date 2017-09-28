#!/bin/bash -eux

MY_DIR="/yt/disk1/ignat/biology"
DATA_DIR="/yt/disk3/ignat/biology"
REFERENCE="${MY_DIR}/hg38/hg38.fa"
GATK="java -jar ${MY_DIR}/GenomeAnalysisTK-3.8-0-ge9d806836/GenomeAnalysisTK.jar"

$GATK \
     -T MuTect2 \
     -R "$REFERENCE" \
     -I:tumor "${DATA_DIR}/P17_298_USPD16081797_H2TGYCCXY_L1_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_298_USPD16081797_H2TGYCCXY_L6_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_298_USPD16081797_H2TGYCCXY_L7_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_298_USPD16081797_H2TGYCCXY_L8_prepared.bam" \
     -I:normal "${DATA_DIR}/D0680_S4_prepared.bam" \
     -o "${DATA_DIR}/P17_298_USPD16081797_H2TGYCCXY.mutect2.vcf"

$GATK \
     -T MuTect2 \
     -R "$REFERENCE" \
     -I:tumor "${DATA_DIR}/P17_323_USPD16081798_H2TGYCCXY_L2_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_323_USPD16081798_H2TGYCCXY_L6_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_323_USPD16081798_H2TGYCCXY_L7_prepared.bam" \
     -I:tumor "${DATA_DIR}/P17_323_USPD16081798_H2TGYCCXY_L8_prepared.bam" \
     -I:normal "${DATA_DIR}/D0680_S4_prepared.bam" \
     -o "${DATA_DIR}/P17_323_USPD16081798_H2TGYCCXY.mutect2.vcf"
