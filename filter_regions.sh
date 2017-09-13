set -eux

FILES="$1"
BED="$2"

BINOM="/yt/disk1/ignat/biology/binom"

export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

for FILE in $FILES; do
    echo "Filtering $FILE"
    samtools view -L ${BED} "/yt/disk3/ignat/biology/${FILE}_sorted.bam" -b > "/yt/disk3/ignat/biology/${FILE}_filtered.bam"
done
