


include FASTQC from "modules/fastqc.nf"

params.reads = "data/reads/ENCSR000COQ1_1.fastq.gz"

workflow {

    read_ch = channel.fromPath(params.reads)
    FASTQC(read_ch)
}


