
nextflow.enable.dsl=2

params.input_csv = "data/single-end.csv"

include { FASTQC } from "./modules/fastqc.nf"

include { TRIM_GALORE } from './modules/trim_galore.nf'

include { HISAT2_ALIGN } from './modules/hisat2_align.nf'


params.reads = "data/reads/ENCSR000COQ1_1.fastq.gz"
params.hisat2_index_zip = "data/genome_index.tar.gz"


workflow {

    read_ch = channel.fromPath(params.reads)
        // Create input channel from the contents of a CSV file
    read_ch = Channel.fromPath(params.input_csv)
        .splitCsv(header:true)
        .map { row -> file(row.fastq_path) }
    FASTQC(read_ch)
    TRIM_GALORE(read_ch)
}


