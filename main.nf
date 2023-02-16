nextflow.enable.dsl=2 

params.inputFile = ""
params.outDir = ""

inputFile = Channel.fromPath(params.inputFile)

workflow {
    main:
        modifyText(inputFile)
}

process modifyText {
    container = "quay.io/nextflow/bash"
    publishDir "${params.outDir}"
    input:
	path inputFile
    output:
	path "output.txt"
    script:
	"""
	cat "${inputFile}" | tr '[:lower:]' '[:upper:]' > output.txt
	"""
}
