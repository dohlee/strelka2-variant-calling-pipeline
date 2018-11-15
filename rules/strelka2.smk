from os.path import join

rule strelka2_tumor_normal:
    input:
        # Required input.
        tumor = wxs_preprocessing(join(config['result_dir']['tumor'], '{tumor}.duplicates_marked.recalibrated.sorted.bam')),
        tumor_index = wxs_preprocessing(join(config['result_dir']['tumor'], '{tumor}.duplicates_marked.recalibrated.sorted.bam.bai')),
        normal = wxs_preprocessing(join(config['result_dir']['normal'], '{normal}.duplicates_marked.recalibrated.sorted.bam')),
        normal_index = wxs_preprocessing(join(config['result_dir']['normal'], '{normal}.duplicates_marked.recalibrated.sorted.bam.bai')),
        reference = config['reference']['fasta'],
        reference_index = config['reference']['fasta'] + '.fai',
    output:
        # Required output.
        snv = join(config['result_dir']['tumor'], '{tumor}_vs_{normal}.snvs.strelka.vcf.gz'),
        indels = join(config['result_dir']['tumor'], '{tumor}_vs_{normal}.indels.strelka.vcf.gz'),
    params:
        # Optional parameters. Omit if unneeded.
        extra = '',
        region = '',  # e.g. chr2:100-2000.
        call_regions = '',  # Here goes a predefined bed file.
    threads: config['threads']['strelka2_tumor_normal']
    wrapper:
        'http://dohlee-bio.info:9193/strelka2/tumor-normal'

