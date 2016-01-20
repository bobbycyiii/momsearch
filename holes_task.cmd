#!/bin/bash
# serial job using 1 node and 8 processor,
# and runs for 24 hours (max).
#SBATCH -N 1 # node count
#SBATCH --ntasks-per-node=8
#SBATCH -t 120:00:00
# sends mail when process begins, and 
# when it ends. Make sure you define your email 
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=yarmola@princeton.edu


bin_dir='/Users/yarmola/Mathematics/Research/MOM2015/momsearch'
words_dir=$bin_dir

search="$bin_dir/dosearch.py"
words="$words_dir/words"
powers="$words_dir/powers_combined"
holes="$bin_dir/holes_to_run"

data_dir='/Volumes/Tosha/validate_run'

cd $bin_dir

python "$search" -w "$words" -p "$powers" -c 8 -d 67 -h "$holes" "$data_dir/source" "$data_dir/output" > "$data_dir/holes.log" 2>&1