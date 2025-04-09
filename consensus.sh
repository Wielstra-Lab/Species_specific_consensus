 

for vcf in *vcf; do

  echo working on $vcf;
  sed -i 's/_:_/_/g' $vcf;
  sed -i 's/,<NON_REF>//' $vcf;
  vcftools --vcf $vcf --out $vcf.2 --minQ 10 --remove-indels --max-alleles 2 --recode;
  bgzip $vcf.2.recode.vcf;
  tabix $vcf.2.recode.vcf.gz;
  bcftools consensus -I -f triturus.mod.RBBH.fasta $vcf.2.recode.vcf.gz > $vcf.con.fa;
  #cat triturus.RBBH.fasta | vcf-consensus $vcf.recode.vcf.gz > $vcf.con.fa;
  
done
  
