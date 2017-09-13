#!/usr/bin/env python

import argparse

from collections import defaultdict

def parse(multivalue_field):
    return map(int, multivalue_field.strip(",").split(","))

def join_segments(segments):
    ends = []
    for start, end in segments:
        ends.append((start, 0))
        ends.append((end, 1))

    result = []

    start = None
    open_count = 0
    for end in ends:
        coord, type = end
        if type == 0:
            if open_count == 0:
                start = coord
            open_count += 1
        else:
            open_count -= 1
            if open_count == 0:
                result.append((start, coord))
                start = None

    assert start is None

    return result

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--genes-file", required=True, help="Path to file with genes")
    parser.add_argument("--ref-genes-file", required=True, help="Path to file with genes coordinates")
    parser.add_argument("--margin", type=int, help="Margin for regions near exomes", default=20)
    parser.add_argument("--bed-output-file", required=True)
    args = parser.parse_args()

    genes = open(args.genes_file).read().split()
    chrom_to_segments = defaultdict(list)
    for line in open(args.ref_genes_file):
        # 585!NR_046018!  chr1!   +!  11873!  14409!  14409!  14409!  3!  11873,12612,13220,! 12227,12721,14409,! 0!  DDX11L1!unk!unk!-1,-1,-1,$
        bin, name, chrom, strand, txStart, txEnd, cdsStart, cdsEnd, exonCount, exonStarts, exonEnds, score, name2, cdsStartStat, cdsEndStat, exonFrames = line.strip().split("\t")
        if name2 in genes:
            for start, end, frame in zip(*map(parse, [exonStarts, exonEnds, exonFrames])):
                if frame == -1:
                    continue
                chrom_to_segments[chrom].append((start - args.margin, end + args.margin))


    with open(args.bed_output_file, "w") as fout:
        for key in chrom_to_segments:
            segments = join_segments(chrom_to_segments[key])
            for start, end in segments:
                print >>fout, key ,start, end

if __name__ == "__main__":
    main()
