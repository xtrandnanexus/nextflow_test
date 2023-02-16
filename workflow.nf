params.inputFile = '/Users/xtran@dnanexus.com/project_7_nextflow/input.txt'
params.outputFile = 'output.txt'

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
