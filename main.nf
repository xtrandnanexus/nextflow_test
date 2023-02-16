nextflow.enable.dsl=2 

params.inputFile = ""

inputFile = Channel.fromPath(params.inputFile)

process modifyText {
    container = 'quay.io/nextflow/bash'
    input:
	path inputFile

    output:
	path "output.txt", emit: text

    script:
    """
    cat "${inputFile}" | tr '[:lower:]' '[:upper:]' > ouput.txt
    """
}

workflow {
	
    main:
        modifyText(inputFile)
    emit:
        modifyText.out.text
}
