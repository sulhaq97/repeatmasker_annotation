# This script reformats the output from RepeatMasker
repeat.masker.data <- read.delim("repeatmasker.hg38.fa.out", header = TRUE)

repeat.masker.data.reformat <- gsub("\\s+", "\t", repeat.masker.data)

head(repeat.masker.data.reformat)

write(repeat.masker.data.reformat, file="repeatmasker.reformat.txt")

