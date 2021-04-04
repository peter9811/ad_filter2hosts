 #!/bin/bash
 for source in `cat filter_list.lst`; do
     echo $source;
     curl --silent $source >> ads.txt
     echo -e "\t`wc -l ads.txt | cut -d " " -f 1` lines downloaded"
 done
 
 echo -e "\nFiltering non-url content..."
 perl convert.pl ads.txt > ads_parsed.txt
 rm ads.txt
 echo -e "\t`wc -l ads_parsed.txt | cut -d " " -f 1` lines after parsing"
 
 echo -e "\nRemoving duplicates..."
 sort -u ads_parsed.txt > adblock.txt
 rm ads_parsed.txt
 echo -e "\t`wc -l ads_unique.txt | cut -d " " -f 1` lines after deduping"
 
 echo -e "\nDone!"
