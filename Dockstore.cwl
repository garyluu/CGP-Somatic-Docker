#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "Seqware-Sanger-Somatic-Workflow"
label: "Seqware-Sanger-Somatic-Workflow"

description: |
   Sanger placeholder text.

dct:creator:
  "@id": "http://sanger.ac.uk/..."
  foaf:name: "Keiran Raine"
  foaf:mbox: "mailto:keiranmraine@gmail.com"

requirements:
  - class: ExpressionEngineRequirement
    id: "#node-engine"
    requirements:
    - class: DockerRequirement
      dockerPull: commonworkflowlanguage/nodejs-engine
    engineCommand: cwlNodeEngine.js
  - class: DockerRequirement
    dockerPull: quay.io/TBD

inputs:
  - id: "#tumor"
    type: File
    inputBinding:
      position: 1
      prefix: "--tumor"
    secondaryFiles:
      - .bai 

  - id: "#normal"
    type: File
    inputBinding:
      position: 2
      prefix: "--normal"
    secondaryFiles:
      - .bai 

  - id: "#refFrom"
    type: File
    inputBinding:
      position: 3
      prefix: "--refFrom"

  - id: "#bbFrom"
    type: File
    inputBinding:
      position: 4
      prefix: "--bbFrom"

  - id: "#outputDir"
    type: string
    inputBinding:
      position: 5
      prefix: "--output-dir"

outputs:
  - id: "#somatic_snv_mnv_vcf"
    type: File
    outputBinding:
      glob: "*.somatic.snv_mnv.vcf.gz"
  - id: "#somatic_snv_mnv_vcf_tbi"
    type: File
    outputBinding:
      glob: "*.somatic.snv_mnv.vcf.gz.tbi"
  - id: "#somatic_snv_mnv_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.snv_mnv.tar.gz"
  - id: "#somatic_cnv_vcf"
    type: File
    outputBinding:
      glob: "*.somatic.cnv.vcf.gz"
  - id: "#somatic_cnv_vcf_tbi"
    type: File
    outputBinding:
      glob: "*.somatic.cnv.vcf.gz.tbi"
  - id: "#somatic_cnv_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.cnv.tar.gz"
  - id: "#somatic_sv_vcf"
    type: File
    outputBinding:
      glob: "*.somatic.sv.vcf.gz"
  - id: "#somatic_sv_vcf_tbi"
    type: File
    outputBinding:
      glob: "*.somatic.sv.vcf.gz.tbi"
  - id: "#somatic_sv_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.sv.tar.gz"
  - id: "#somatic_indel_vcf"
    type: File
    outputBinding:
      glob: "*.somatic.indel.vcf.gz"
  - id: "#somatic_indel_vcf_tbi"
    type: File
    outputBinding:
      glob: "*.somatic.indel.vcf.gz.tbi"
  - id: "#somatic_indel_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.indel.tar.gz"
  - id: "#somatic_imputeCounts_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.imputeCounts.tar.gz"
  - id: "#somatic_genotype_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.genotype.tar.gz"
  - id: "#somatic_verifyBamId_tar_gz"
    type: File
    outputBinding:
      glob: "*.somatic.verifyBamId.tar.gz"

baseCommand: ["python", "/home/seqware/CGP-Somatic-Docker/scripts/run_seqware_workflow.py"]
