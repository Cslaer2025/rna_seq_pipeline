
# RNA-seq Analysis Pipeline (UNMC)

A modular, scalable RNA-seq pipeline for quantifying and analyzing gene expression data. Built using **Nextflow**, **Salmon**, and **DESeq2**, with reproducibility and clarity in mind.

---

## 🧪 Features
- Pseudo-alignment using [Salmon](https://salmon.readthedocs.io)
- Quantification to transcript- and gene-level
- Differential expression analysis with [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)
- Modular structure using Nextflow
- Easy setup via Conda environments
- Generates QC reports, PCA plots, and volcano plots

---

## 🔧 Requirements

- Nextflow
- Conda / Mamba
- Git
- Internet access (for pulling reference or demo data)

---

## 📁 Repo Structure

| Folder         | Description                                   |
|----------------|-----------------------------------------------|
| `data/`        | Input FASTQ files or sample accessions        |
| `results/`     | All output files: quant, stats, plots         |
| `workflow/`    | Nextflow scripts (`main.nf`, modules, etc.)   |
| `scripts/`     | Custom R and Python scripts for plotting, QC  |
| `envs/`        | Conda YAMLs for reproducibility                |
| `config/`      | Sample sheet, pipeline settings                |

---

## ▶️ Quick Start

```bash
# clone the repo
git clone https://github.com/Cslaer2025/rna_seq_pipeline.git
cd rna_seq_pipeline

# run pipeline (demo mode)
nextflow run workflow/main.nf -profile conda

# rna_seq_pipeline
Modular RNA-seq pipeline using Nextflow, Salmon, and DESeq2
>>>>>>> f6ec3f3659f13f73b855f193dcad2c5ce5b0522a
