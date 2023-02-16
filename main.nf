#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process modifyText {
    input:
    file(params.inputFile)

    output:
    file(params.outputFile)

    script:
    """
    cat ${params.inputFile} | tr '[:lower:]' '[:upper:]' > ${params.outputFile}
    """
}

workflow {
	modifyText(params.inputFile)
}
