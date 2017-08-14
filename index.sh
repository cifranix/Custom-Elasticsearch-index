#/bin/bash

#get time for timestamp
timestamp=`date +"%Y-%m-%dT%T.%3N"`

curl -X POST "http://elasticsearch:9200/bgp/status/" \
-H "Content-Type: application/json" \
-H "Cache-Control: no-cache" \
--data @<(cat <<EOF
                {
                  "timestamp" : "$timestamp",
                  
                  #samepleVarX will show up in kibana / elastic search once the new index is added
                  "sampleVar1" :"${someBashVar[$COUNTER]}",
                  "sampleVar3" : "${anotherBashVar[$COUNTER]}",
                  "sampleVar2" : "$one_moreBachVar"
 }
EOF
)
