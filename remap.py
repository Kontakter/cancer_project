import argparse
    
from pyliftover import LiftOver

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--chain", required=True)
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--unmapped", required=True)
    args = parser.parse_args()

    lift_over = LiftOver(args.chain)

    with open(args.input) as fin, open(args.output, "w") as fout, open(args.unmapped, "w") as unmapped:
        for line in fin:
            if line.startswith("#"):
                fout.write(line)
                continue

            chr, pos, remaining = line.split("\t", 2)
            pos = int(pos)
            res = lift_over.convert_coordinate(chr, pos - 1)
            if res:
                res = res[0]
                fout.write(res[0])
                fout.write("\t")
                fout.write(str(res[1] + 1))
                fout.write("\t")
                fout.write(remaining)
            else:
                unmapped.write(line)


if __name__ == "__main__":
    main()
