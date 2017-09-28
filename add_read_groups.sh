#!/bin/bash -eux

MY_DIR="/yt/disk1/ignat/biology"
BINOM="${MY_DIR}/binom"
PICARD="java -jar ${MY_DIR}/picard/dist/picard.jar"
export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

#A00175:36:BH2NKVDMXX:1:1409:14733:10911
$PICARD AddOrReplaceReadGroups \
      I=/yt/disk3/ignat/biology/D0680_S4_filtered.bam \
      O=/yt/disk3/ignat/biology/D0680_S4_prepared.bam \
      RGID=S4 \
      RGLB=FULL_GENOME \
      RGPL=ILLUMINA \
      RGPU=BH2NKVDMXX.1.1 \
      RGSM=HEALTH
    
samtools index /yt/disk3/ignat/biology/D0680_S4_prepared.bam

#E00526:91:H2TGYCCXY:1:1108:16336:13088
for index in 1 6 7 8; do
    $PICARD AddOrReplaceReadGroups \
          I=/yt/disk3/ignat/biology/P17_298_USPD16081797_H2TGYCCXY_L${index}_filtered.bam \
          O=/yt/disk3/ignat/biology/P17_298_USPD16081797_H2TGYCCXY_L${index}_prepared.bam \
          RGID=USPD16081797 \
          RGLB=FULL_GENOME \
          RGPL=ILLUMINA \
          RGPU=H2TGYCCXY.${index}.1 \
          RGSM=METASTASIS

    samtools index /yt/disk3/ignat/biology/P17_298_USPD16081797_H2TGYCCXY_L${index}_prepared.bam
done

#E00526:91:H2TGYCCXY:2:2123:23825:70856
for index in 2 6 7 8; do
    $PICARD AddOrReplaceReadGroups \
          I=/yt/disk3/ignat/biology/P17_323_USPD16081798_H2TGYCCXY_L${index}_filtered.bam \
          O=/yt/disk3/ignat/biology/P17_323_USPD16081798_H2TGYCCXY_L${index}_prepared.bam \
          RGID=USPD16081798 \
          RGLB=FULL_GENOME \
          RGPL=ILLUMINA \
          RGPU=H2TGYCCXY.${index}.1 \
          RGSM=TUMOR
    
    samtools index /yt/disk3/ignat/biology/P17_323_USPD16081798_H2TGYCCXY_L${index}_prepared.bam
done
