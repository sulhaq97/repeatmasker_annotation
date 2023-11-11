# Script written & run by Sami Ul Haq on Nov 2, 2021

## This part of the script reformats the output from RepeatMasker
repeat.masker.data <- read.delim("repeatmasker.hg38.fa.out", header = TRUE)
repeat.masker.data.reformat <- gsub("\\s+", "\t", repeat.masker.data)
#head(repeat.masker.data.reformat)
write(repeat.masker.data.reformat, file="repeatmasker.reformat.txt")

## This part of the script reads the RepeatMasker (run on hg38) data
# and gets the annotations (i.e. LINEs, SINEs, repeats, etc.)

# Data is downloaded from UCSC (repeatmasker annotations)rm
# updated: 2021-09-03
# https://genome.ucsc.edu/cgi-bin/hgTables?hgsid=1204072203_RxTgbbtFiWUNcCSGPEW2gSSKx76h&clade=mammal&org=Human&db=hg38&hgta_group=rep&hgta_track=rmsk&hgta_table=0&hgta_regionType=genome&position=chrX%3A15%2C560%2C138-15%2C602%2C945&hgta_outputType=bed&hgta_outFileName=repeatmasker.hg38

library(rtracklayer)
library(GenomicRanges)

setwd("C:/Users/Sami/OneDrive - University of Toronto/Masters/cfMeDIP/data/RepeatMasker Data")

# annotation data read
blah <- read.table("repeatmasker.hg38.table.txt")

# column names
colnames(blah) <- c("bin",	"swScore",	"milliDiv",	"milliDel",	"milliIns",	"chromosome",	"start", 
                    "end",	"genoLeft",	"strand",	"repeat.name",	"repeat.class",	"repeat.family",	"repStart",	"repEnd",	"repLeft", "id")

# need only chr, start, end, repeat name, repeat class, and repeat family
blah <- blah[,c("chromosome",	"start", "end", "repeat.name",	"repeat.class",	"repeat.family")]

ucsc.repeatmasker.annotations <- makeGRangesFromDataFrame(blah, keep.extra.columns = TRUE)

save(ucsc.repeatmasker.annotations, file = "ucsc.repeatmasker.annotations.RData")
