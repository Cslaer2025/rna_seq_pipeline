![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)
![Nextflow DSL2](https://img.shields.io/badge/nextflow-dsl2-43B02A)
![Built with Conda](https://img.shields.io/badge/env-conda-3E7EBB)
![Made by Cleofes](https://img.shields.io/badge/made%20by-Cleofes%20Sarmiento-ff69b4)

# RNA-seq Analysis Pipeline

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
---

## 🚀 How to Run the Pipeline

Make sure you have [Nextflow](https://www.nextflow.io/) and [Conda](https://docs.conda.io/en/latest/) installed.

### 📁 Project Structure
rna_seq_pipeline/ ├── config/ │ └── samplesheet.csv # Sample metadata ├── data/ │ └── transcriptome.fa # Reference transcriptome ├── scripts/ │ └── deseq2.R # DESeq2 analysis script ├── results/ ├── main.nf # Nextflow workflow └── .gitignore

### ▶️ Command to Run

```bash
nextflow run main.nf -profile standard

By default, this will:

Build a Salmon index

Run quantification on paired-end reads

Perform DESeq2 differential expression analysis

Output: results/deseq2_results.csv
🧪 Sample Sheet Format
sample_id	condition	fastq_1	fastq_2
sample1	control	data/sample1_R1.fastq.gz	data/sample1_R2.fastq.gz
sample2	treatment	data/sample2_R1.fastq.gz	data/sample2_R2.fastq.gz
yaml
Copy
Edit

---

### 🔹 3. Save and exit `nano`:
- Press `Ctrl + O` → then **Enter** to save
- Press `Ctrl + X` to exit

---

## ✅ Git Commands to Commit and Push the README Update

```bash
cd ~/rna_seq_pipeline
git add README.md
git commit -m "Add usage instructions and project layout to README"
git push
