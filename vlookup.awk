function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN{
 FS=","
}

FNR==NR{
 if(FNR==1){
  if(C1 !~ /^[0-9]+$/ || C3 !~ /^[0-9]+$/){
   for(i=1;i<=NF;i++){
     if(trim(tolower($i))==trim(tolower(C1))){
      C1=i
      if(C3 ~ /^[0-9]+$/)
       break
     }
     else if(trim(tolower($i))==trim(tolower(C3))){
      C3=i
      if(C1 ~ /^[0-9]+$/)
       break
     }
   }
   if(i>NF){
    if(C1 !~ /^[0-9]+$/)
     print "No matching column found for "C1". Program will exit now..."
    if(C3 !~ /^[0-9]+$/)
     print "No matching column found for "C3". Program will exit now..."
    exit 1
   }
  }
 }
 if($C1 in a){
  print "Non-unique values found in lookup file. Please correct this. Program will exit now"
  print $C1
  exit 1
 }
 a[$C1]=$C3
 next
}
FNR==1{
 if(!(C2 ~ /^[0-9]+$/)){
  for(i=1;i<=NF;i++){
    if($i==C2){
     C2=i
     break
    }
  }
  if(i>NF){
   print "No matching column found for "C2". Program will exit now..."
   exit 1
  }
 }
 print $0","toupper(C6) > C4
 next
}
($C2 in a){
 print $0","a[$C2] >> C4
}
!($C2 in a){
 print $0 >> C5
}

