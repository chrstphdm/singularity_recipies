DIR_CACHE=/mnt/isilon_data_nfs/BIO_INFO/TEAM_bioinfo_CBP/DATA/REFERENCES/HG19/CACHE_VEP
DIR_PLUGINS=/mnt/isilon_data_nfs/BIO_INFO/TEAM_bioinfo_CBP/DATA/VEP_PLUGINS/96
REF_FILE=/mnt/isilon_data_nfs/BIO_INFO/TEAM_bioinfo_CBP/DATA/REFERENCES/HG19/UCSC/ucsc.hg19.fasta
VCF_TEST_FILE=/mnt/isilon_data_cifs/BIO_INFO/Christophe/TEST_GATK_3.7/GATK-V3.7-0.8/P2-L1611568D02_S2.vcf
EXEC_COMMAND="slub exec vep:96 vep --refseq --offline --format vcf --vcf --hgvs --no_stats --cache --dir_cache ${DIR_CACHE} --dir_plugins ${DIR_PLUGINS} --fasta ${REF_FILE} -i ${VCF_TEST_FILE}"


echo "NO_PLUGIN"
time ${EXEC_COMMAND} -o test_NO_PLUGIN.vcf  
echo "HGVSIntronOffset"
time ${EXEC_COMMAND} -o test_HGVSIntronOffset.vcf --plugin HGVSIntronOffset --no_stats
echo "CADD"
time ${EXEC_COMMAND} -o test_CADD.vcf --plugin CADD,/mnt/isilon_data_nfs/BIO_INFO/TEAM_bioinfo_CBP/DATA/REFERENCES/HG19/CADD/1.4/whole_genome_SNVs.tsv.gz,/mnt/isilon_data_nfs/BIO_INFO/TEAM_bioinfo_CBP/DATA/REFERENCES/HG19/CADD/1.4/InDels.tsv.gz --no_stats
echo "LOVD"
time ${EXEC_COMMAND} -o test_LOVD.vcf --plugin LOVD --no_stats
echo "MaxEntScan"
time ${EXEC_COMMAND} -o test_MAXENTSCAN.vcf --plugin MaxEntScan,${DIR_PLUGINS}/MaxEntScan_wrappers/,SWA,NCSS
echo "PHENOTYPES"
time ${EXEC_COMMAND} -o test_PHENOTYPES.vcf --plugin Phenotypes
echo "G2P"
time ${EXEC_COMMAND} -o test_G2P.vcf --plugin G2P,file=${DIR_PLUGINS}/G2P_data_files/G2P.csv,af_monoallelic=0.05,af_keys=AA\&gnomAD_ASJ,types=stop_gained\&frameshift_variant
echo "REFERENCE_QUALITY"
time ${EXEC_COMMAND} -o test_REFERENCE_QUALITY.vcf --plugin ReferenceQuality,${DIR_PLUGINS}/reference_quality_files/sorted_GRCh37_quality_mergedfile.gff3.gz
echo "SPLICE_REGION"
time ${EXEC_COMMAND} -o test_SPLICE_REGION.vcf --plugin SpliceRegion
echo "REVEL"
time ${EXEC_COMMAND} -o test_REVEL.vcf --plugin REVEL,${DIR_PLUGINS}/revel_files/new_tabbed_revel.tsv.gz
