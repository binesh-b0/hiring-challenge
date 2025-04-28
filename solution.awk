#!/usr/bin/awk -f
BEGIN {
  FS = "[|]"
  max = 0
}

# skip comments, blank lines
/^[^#]/ && NF>1 {
  
  for(i=1; i<=NF; i++){
    gsub(/^[ \t]+|[ \t]+$/, "", $i)
  }
  
  if($3=="Mars" && $4=="Completed"){
    dur = $6 + 0        # numeric duration
    if(dur > max){
      max = dur
      code = $8
    }
  }
}

END {
  if(max>0)
    printf(" days = %d \ncode = %s\n", max, code)
  else
    print "No Completed Mars missions found."
}
