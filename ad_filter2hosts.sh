#!/bin/bash

echo "Starting ad_filter2hosts conversion..."
echo "--------------------------------------"

# Create a temporary file for downloaded content
echo "" >ads.txt

for source in $(cat filter_list.lst); do
    echo "Downloading: $source"
    curl --silent $source >>ads.txt
    echo -e "\t$(wc -l ads.txt | cut -d " " -f 1) lines downloaded so far"
done

echo -e "\nFiltering non-url content..."
perl convert.pl ads.txt >ads_parsed.txt
rm ads.txt
echo -e "\t$(wc -l ads_parsed.txt | cut -d " " -f 1) lines after parsing"

echo -e "\nRemoving duplicates..."
sort -u ads_parsed.txt >hosts_filtered.txt
rm ads_parsed.txt
echo -e "\t$(wc -l hosts_filtered.txt | cut -d " " -f 1) lines after deduping"

echo -e "\nDone! Final hosts file saved as hosts_filtered.txt"
echo "--------------------------------------"
