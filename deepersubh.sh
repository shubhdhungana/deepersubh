#!/bin/bash

DOMAIN=$1
DIRECTORY=${DOMAIN}_Deeper_Sub
mkdir $DIRECTORY

# 1st level subdomain enumeration
echo " "
echo " Now, starting 1st level subdomain enumeration"
echo " "
subfinder -d $DOMAIN | tee $DIRECTORY/subfinder_1.txt
assetfinder --subs-only $DOMAIN | tee $DIRECTORY/assetfinder_1.txt
amass enum -d $DOMAIN -o $DIRECTORY/amass_1.txt
cat $DIRECTORY/subfinder_1.txt $DIRECTORY/assetfinder_1.txt $DIRECTORY/amass_1.txt | sort -u | tee $DIRECTORY/1st_level_subdomains_all.txt

# 2nd level subdomain enumeration
echo " "
echo " Now, starting 2nd level subdomain enumeration"
echo " "
cat $DIRECTORY/subfinder_1.txt $DIRECTORY/assetfinder_1.txt $DIRECTORY/amass_1.txt | sort -u | httprobe -c 50 | sed 's/https\?:\/\///' | awk -F/ '{print $1}' | sort -u | tee $DIRECTORY/all_subdomains_2.txt
subfinder -dL $DIRECTORY/all_subdomains_2.txt | tee $DIRECTORY/subfinder_2.txt
assetfinder --subs-only -d $DIRECTORY/all_subdomains_2.txt | tee $DIRECTORY/assetfinder_2.txt
amass enum -d $DOMAIN -rf $DIRECTORY/all_subdomains_2.txt -o $DIRECTORY/amass_2.txt
cat $DIRECTORY/subfinder_2.txt $DIRECTORY/assetfinder_2.txt $DIRECTORY/amass_2.txt | sort -u | tee $DIRECTORY/2nd_level_subdomains_all.txt

# 3rd level subdomain enumeration
echo " "
echo " Now, starting 3rd level subdomain enumeration"
echo " "
cat $DIRECTORY/subfinder_2.txt $DIRECTORY/assetfinder_2.txt $DIRECTORY/amass_2.txt | sort -u | httprobe -c 50 | sed 's/https\?:\/\///' | awk -F/ '{print $1}' | sort -u | tee $DIRECTORY/all_subdomains_3.txt
subfinder -dL $DIRECTORY/all_subdomains_3.txt | tee $DIRECTORY/subfinder_3.txt
assetfinder --subs-only -d $DIRECTORY/all_subdomains_3.txt | tee $DIRECTORY/assetfinder_3.txt
amass enum -d $DOMAIN -rf $DIRECTORY/all_subdomains_3.txt -o $DIRECTORY/amass_3.txt
cat $DIRECTORY/subfinder_3.txt $DIRECTORY/assetfinder_3.txt $DIRECTORY/amass_3.txt | sort -u | tee $DIRECTORY/3rd_level_subdomains_all.txt

# 4th level subdomain enumeration
echo " "
echo " Now, starting 4th level subdomain enumeration"
echo " "
cat $DIRECTORY/subfinder_3.txt $DIRECTORY/assetfinder_3.txt $DIRECTORY/amass_3.txt | sort -u | httprobe -c 50 | sed 's/https\?:\/\///' | awk -F/ '{print $1}' | sort -u | tee $DIRECTORY/all_subdomains_4.txt
subfinder -dL $DIRECTORY/all_subdomains_4.txt | tee $DIRECTORY/subfinder_4.txt
assetfinder --subs-only -d $DIRECTORY/all_subdomains_4.txt | tee $DIRECTORY/assetfinder_4.txt
amass enum -d $DOMAIN -rf $DIRECTORY/all_subdomains_4.txt -o $DIRECTORY/amass_4.txt
cat $DIRECTORY/subfinder_4.txt $DIRECTORY/assetfinder_4.txt $DIRECTORY/amass_4.txt | sort -u | tee $DIRECTORY/4th_level_subdomains_all.txt
   

# deleting unnecessary files and keeping necessary files
echo "Deleting unnecessary files"
echo " "
rm -rf $DIRECTORY/subfinder_1.txt $DIRECTORY/assetfinder_1.txt $DIRECTORY/amass_1.txt $DIRECTORY/subfinder_2.txt $DIRECTORY/assetfinder_2.txt $DIRECTORY/amass_2.txt $DIRECTORY/subfinder_3.txt $DIRECTORY/assetfinder_3.txt $DIRECTORY/amass_3.txt $DIRECTORY/subfinder_4.txt $DIRECTORY/assetfinder_4.txt $DIRECTORY/amass_4.txt
echo " "
echo "Now showing all subdomains obtained at once"
echo " "
cat $DIRECTORY/1st_level_subdomains_all.txt $DIRECTORY/all_subdomains_2.txt $DIRECTORY/2nd_level_subdomains_all.txt $DIRECTORY/all_subdomains_3.txt $DIRECTORY/3rd_level_subdomains_all.txt $DIRECTORY/all_subdomains_4.txt $DIRECTORY/4th_level_subdomains_all.txt | sort -u | tee $DIRECTORY/all_deeper_subdomains.txt
echo " "
rm -r $DIRECTORY/1st_level_subdomains_all.txt $DIRECTORY/all_subdomains_2.txt $DIRECTORY/2nd_level_subdomains_all.txt $DIRECTORY/all_subdomains_3.txt $DIRECTORY/3rd_level_subdomains_all.txt $DIRECTORY/all_subdomains_4.txt $DIRECTORY/4th_level_subdomains_all.txt
echo " "
echo " "
echo "NOW YOU CAN ENJOY YOUR DEEPER SUBDOMAINS OBTAINED"







