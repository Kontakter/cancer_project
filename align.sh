set -eux

FILES="$1"
DIR="$2"

set +u
if [ -z "$3" ]; then
    EXT="fq.gz"
else
    EXT="$3"
fi

REFERENCE="/yt/disk1/ignat/biology/hg38/hg38.fa"
BINOM="/yt/disk1/ignat/biology/binom"

export PATH="$BINOM/contrib/bwa:$BINOM/contrib/samtools:$PATH"

for FILE in $FILES; do 
    echo "Aligning $FILE"
    bwa mem -M -t 24 "$REFERENCE" "${DIR}/${FILE}_1.${EXT}" "${DIR}/${FILE}_2.${EXT}" | samtools view -bS - > "/yt/disk3/ignat/biology/${FILE}.bam"
done
