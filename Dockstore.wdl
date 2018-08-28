task Seqware_Sanger_Somatic_Workflow {
    File tumorBam
    File tumorBai
    File normalBam
    File normalBai
    File refFrom
    File bbFrom
    String outputDir = "."

    command {
        python /home/seqware/CGP-Somatic-Docker/scripts/run_seqware_workflow.py \
        --tumor ${tumorBam} \
        --normal ${normalBam} \
        --refFrom ${refFrom} \
        --bbFrom ${bbFrom} \
        --output-dir ${outputDir}
    }

    output {
        Array[File] somatic_snv_mnv_tar_gz = glob('${outputDir}*.somatic.snv_mnv.tar.gz')
        Array[File] somatic_cnv_tar_gz = glob('${outputDir}*.somatic.cnv.tar.gz')
        Array[File] somatic_sv_tar_gz = glob('${outputDir}*.somatic.sv.tar.gz')
        Array[File] somatic_indel_tar_gz = glob('${outputDir}*.somatic.indel.tar.gz')
        Array[File] somatic_imputeCounts_tar_gz = glob('${outputDir}*.somatic.imputeCounts.tar.gz')
        Array[File] somatic_genotype_tar_gz = glob('${outputDir}*.somatic.genotype.tar.gz')
        Array[File] somatic_verifyBamId_tar_gz = glob('${outputDir}*.somatic.verifyBamId.tar.gz')
    }

    runtime {
        docker: 'quay.io/pancancer/pcawg-sanger-cgp-workflow:2.0.0-cwl1'
    }
    meta {
        author: "Keiran Raine"
        email: "keiranmraine@gmail.com"
        description: "The Sanger's Cancer Genome Project core somatic calling workflow from \nthe\
            \ ICGC PanCancer Analysis of Whole Genomes (PCAWG) project.\nFor more information\
            \ see the PCAWG project [page](https://dcc.icgc.org/pcawg) and our GitHub\n[page](https://github.com/ICGC-TCGA-PanCancer)\
            \ for our code including the source for\n[this workflow](https://github.com/ICGC-TCGA-PanCancer/CGP-Somatic-Docker)."
    }

}

workflow Seqware_Sanger_Somatic_Workflow {
    call Seqware_Sanger_Somatic_Workflow
}
