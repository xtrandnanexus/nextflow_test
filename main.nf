nextflow.enable.dsl=2 

params.inputFile = ""
params.outDir = ""

inputFile = Channel.fromPath(params.inputFile)

process modifyText {
    container = 'quay.io/nextflow/bash'
    publishDir "${params.outDir}"
    input:
	path inputFile

    output:
	path "output.txt", emit: text

    script:
    """
    cat "${inputFile}" | tr '[:lower:]' '[:upper:]' > output.txt
    """
}

workflow {
	
    main:
        modifyText(inputFile)
    emit:
        modifyText.out.text
}
