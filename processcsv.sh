< $1 tr -d -c "[:print:]^\n" > tempf.csv
awk -F '"' -v RS="^^^^^^^" -v OFS='"' '{for(i=2;i<=NF;i+=2){gsub("\n","",$i)}} 1' tempf.csv > tempf1.csv
awk -F '"' -v OFS='"' '{for(i=2;i<=NF;i+=2){gsub(",","|||",$i)}} 1' tempf1.csv > tempf2.csv
awk 'NF' tempf2.csv > tempf3.csv
awk -F ',' 'BEGIN{min=1000;max=0} {if(NF<min){min=NF};if(NF>max){max=NF}} END{print min" "max}' tempf3.csv
mv tempf3.csv $1_op
rm tempf.csv tempf1.csv tempf2.csv
wc -l $1_op
