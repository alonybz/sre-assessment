#!/usr/bin/env bash
# Usage: ./gencsv.sh START END [OUTFILE]
# Generates lines "i, rnd" for i in [START, END] into OUTFILE (default: inputFile)

set -Eeuo pipefail

usage() {
  echo "Usage: $0 START END [OUTFILE]" >&2
  echo "  START, END  : integer range (END must be >= START)" >&2
  echo "  OUTFILE     : optional output file name (default: inputFile)" >&2
  exit 1
}

# Check number of arguments
if (( $# < 2 || $# > 3 )); then
  usage
fi

start=$1
end=$2
outfile=${3:-inputFile}

# Validate both are integers
if ! [[ "$start" =~ ^-?[0-9]+$ && "$end" =~ ^-?[0-9]+$ ]]; then
  echo "Error: START and END must be integers" >&2
  usage
fi

# Check that end >= start
if (( end < start )); then
  echo "Error: END must be >= START" >&2
  exit 1
fi

# Truncate/create output file
: > "$outfile"

# Generate lines (single redirection for efficiency)
{
  for (( i = start; i <= end; i++ )); do
    rnd=$(( RANDOM % 1000 ))
    printf '%s, %s\n' "$i" "$rnd"
  done
} > "$outfile"

line_count=$(( end - start + 1 ))
echo "Wrote $line_count lines to $outfile"