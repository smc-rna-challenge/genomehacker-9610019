arguments:
- {position: 1, prefix: -D, valueFrom: $(inputs.gmapdb)}
- {position: 96, prefix: -O, valueFrom: $(runtime.outdir)}
baseCommand: [gfusion]
class: CommandLineTool
cwlVersion: v1.0
doc: 'gfusion: alignment and analysis for finding gene fusions'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/genomehacker-9610019-gfusion:1.0.0'}
inputs:
- id: aligndir
  inputBinding: {position: 96, prefix: -A}
  type: Directory
- id: fastq1
  inputBinding: {position: 98}
  type: File
- id: fastq2
  inputBinding: {position: 99}
  type: ['null', File]
- id: genesfile
  inputBinding: {position: 5, prefix: -m}
  type: string
- id: genome_db
  inputBinding: {position: 4, prefix: -d}
  type: string
- id: genome_splicesites
  inputBinding: {position: 7, prefix: -s}
  type: string
- {id: gmapdb, type: Directory}
- id: gunzip
  inputBinding: {position: 97, prefix: -g}
  type: boolean
- id: nthreads
  inputBinding: {position: 8, prefix: -t}
  type: int
- id: readlength
  inputBinding: {position: 2, prefix: -R}
  type: int
- id: transcript_splicesites
  inputBinding: {position: 6, prefix: -r}
  type: string
- id: transcriptome_db
  inputBinding: {position: 3, prefix: -c}
  type: string
outputs:
- id: output
  outputBinding: {glob: sample.report.bedpe}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: ResourceRequirement, coresMin: 8, ramMin: 60000}
