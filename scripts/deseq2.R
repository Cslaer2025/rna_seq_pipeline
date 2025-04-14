#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 2) {
  stop("Usage: Rscript deseq2.R <quant.sf files> <output_file>")
}

# Libraries
suppressPackageStartupMessages({
  library(tximport)
  library(DESeq2)
  library(readr)
  library(tibble)
  library(tools)
})

# Parse arguments
quant_files <- args[1:(length(args)-1)]
output_file <- args[length(args)]

# Create named vector of quant files
samples <- file_path_sans_ext(basename(quant_files))
names(quant_files) <- samples

# Import transcript-level quantifications
txi <- tximport(files = quant_files, type = "salmon", txOut = TRUE)

# Create metadata (assumes samples are formatted as: sample_condition_*.sf)
condition <- ifelse(grepl("control", samples), "control", "treatment")
coldata <- data.frame(row.names = samples, condition = factor(condition))

# DESeq2 analysis
dds <- DESeqDataSetFromTximport(txi, colData = coldata, design = ~condition)
dds <- DESeq(dds)
res <- results(dds)
res <- as.data.frame(res)
res$gene <- rownames(res)

# Write results
write.csv(res, output_file, row.names = FALSE)
