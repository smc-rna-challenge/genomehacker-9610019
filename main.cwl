class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': genomehacker@synapse.org,
  'foaf:name': genomehacker}
doc: 'SMC-RNA challenge fusion detection submission

  gfusion workflow: tar genome index, analyze with gfusion'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: genome_db, type: File}
- {id: transcriptome_db, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: gfusion/output, type: File}
steps:
- id: gfusion
  in:
  - {default: aligndir, id: aligndir}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {default: ensembl.known.genes, id: genesfile}
  - {default: GRCh37.75, id: genome_db}
  - {default: ensembl.known.splicesites, id: genome_splicesites}
  - {id: gmapdb, source: tar2/output}
  - {default: true, id: gunzip}
  - {default: 12, id: nthreads}
  - {default: 100, id: readlength}
  - {default: transcript.splicesites, id: transcript_splicesites}
  - {default: GRCh37.75.transcripts, id: transcriptome_db}
  out: [output]
  run: gfusion.cwl
- id: tar1
  in:
  - {id: input, source: transcriptome_db}
  out: [output]
  run: tarz.cwl
- id: tar2
  in:
  - {id: input, source: genome_db}
  out: [output]
  run: tar.cwl
