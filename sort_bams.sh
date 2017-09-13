set -eux

FILES="$1"

BINOM="/yt/disk1/ignat/biology/binom"

export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

for FILE in $FILES; do
    echo "Sorting $FILE"
    samtools sort -o "/yt/disk3/ignat/biology/${FILE}.bam" - > "/yt/disk3/ignat/biology/${FILE}_sorted.bam"
done
