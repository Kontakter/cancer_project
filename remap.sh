#!/bin/bash -eux

for FILE in "P17_323_USPD16081798_H2TGYCCXY.mutect2" "P17_298_USPD16081797_H2TGYCCXY.mutect2"; do 
    python remap.py --chain /yt/disk1/ignat/biology/hg38ToHg19.over.chain --input /yt/disk3/ignat/biology/${FILE}.vcf --output /yt/disk3/ignat/biology/${FILE}.fixed.vcf --unmapped /yt/disk3/ignat/biology/${FILE}.unmapped.vcf
done
