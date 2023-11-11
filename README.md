# RepeatMasker reader
Script to read RepeatMasker data for downstream analysis. Data is downloaded from https://www.repeatmasker.org/species/hg.html and the following file is used: hg38.fa.out.gz

Considering the size of the data, this should be downloaded to a high-performance computing cluster (ideally >16GB) memory in order to open and read the file.

### Dependencies
* R version 3.6.1 (or above)
* R libraries lincluding rtracklayer and GenomicRanges
* BASH
* Linux-powered high-performance computing cluster with a SLURM workload manager

### Usage
The script should be run in the following manner
```
sbatch repeat.masker.running.sh
```

### Output
The output of the script is two files:
* A reformatted text file called "repeatmasker.reformat.txt" which will contain RepeatMasker data
* An RData file containing a GRange object indicating repeat elements in the genome by chromosome location, repeat name, repeat class, and repeat family
