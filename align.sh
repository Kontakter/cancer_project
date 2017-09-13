set -eux

FILES="$1"
DIR="$2"

REFERENCE="/yt/disk1/ignat/biology/hg38/hg38.fa"
BINOM="/yt/disk1/ignat/biology/binom"

export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

for FILE in $FILES; do 
    echo "Aligning $FILE"
    bwa mem -M -t 24 "$REFERENCE" "${DIR}/${FILE}_1.fq.gz" "${DIR}/${FILE}_2.fq.gz" | samtools view -bS - > "/yt/disk3/ignat/biology/${FILE}.bam"
done
