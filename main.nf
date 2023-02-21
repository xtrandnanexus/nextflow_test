nextflow.enable.dsl=2 

params.inputFile = ""

inputFile = Channel.fromPath(params.inputFile)

workflow {
    main:
        modifyText(inputFile)
    emit:
        modifyText.out.txt
}

process modifyText {
    container = "quay.io/nextflow/bash"
    input:
	file inputFile
    output:
	path "output.txt", emit: txt
    script:
	"""
	cat ${inputFile} | tr '[:lower:]' '[:upper:]' > output.txt
	"""
}
