#!/usr/bin/env nextflow

/*
 * RNA-seq pipeline using Salmon + DESeq2
 * Author: Cleofes Sarmiento, PhD
 * Description: Modular and scalable RNA-seq workflow for quantification and differential expression analysis.
 */

nextflow.enable.dsl=2

params.samplesheet = file('config/samplesheet.csv')
params.transcriptome = file('data/transcriptome.fa')
params.index_dir = 'results/salmon_index'
params.outdir = 'results'

workflow {

    // Create transcriptome index if it doesn't exist
    SALMON_INDEX(params.transcriptome)

    // Load sample sheet
    samples = readSamples(params.samplesheet)

    // Run Salmon quantification
    SALMON_QUANT(samples)

    // Run DESeq2 analysis
    DESEQ2_ANALYSIS(SALMON_QUANT.out.collect())
}

// Function to read the sample sheet into a channel
def readSamples(file) {
    Channel
        .fromPath(file)
        .splitCsv(header: true)
        .map { row -> tuple(row.sample_id, row.condition, file(row.fastq_1), file(row.fastq_2)) }
}

// Process: Salmon Index
process SALMON_INDEX {

    input:
    path transcriptome from params.transcriptome

    output:
    path params.index_dir

    script:
    """
    salmon index -t ${transcriptome} -i ${params.index_dir}
    """
}

// Process: Salmon Quantification
process SALMON_QUANT {

    input:
    tuple val(sample_id), val(condition), path(fq1), path(fq2)

    output:
    tuple val(sample_id), path("${sample_id}/quant.sf")

    script:
    """
    mkdir -p ${sample_id}
    salmon quant -i ${params.index_dir} -l A -1 ${fq1} -2 ${fq2} -p 4 -o ${sample_id}
    """
}

// Process: DESeq2 Analysis
process DESEQ2_ANALYSIS {

    input:
    path quant_files

    output:
    path "${params.outdir}/deseq2_results.csv"

    script:
    """
    Rscript scripts/deseq2.R ${quant_files.join(' ')} ${params.outdir}/deseq2_results.csv
    """
}
