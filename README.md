# Deepersubh
# Deeper Level (Upto 4th Level) Subdomain Enumeration Script

My New Deeper Level Subdomain Enumeration Automation Script Tool That Does Automated Enumeration Upto 4th Level Deep
Subdomain Enumeration Script

This is a bash script that can be used to enumerate subdomains of a given domain name. The script uses three subdomain enumeration tools: Subfinder, Assetfinder, and Amass.
Usage

The script can be executed by running the following command:

# Usage:

./subdomain_enumeration.sh example.com

This will create a directory named example.com_Deeper_Sub and perform subdomain enumeration for the specified domain.
Output

The script will output four files containing the enumerated subdomains:

    1st_level_subdomains_all.txt : contains all the 1st level subdomains found
    2nd_level_subdomains_all.txt : contains all the 2nd level subdomains found
    3rd_level_subdomains_all.txt : contains all the 3rd level subdomains found
    4th_level_subdomains_all.txt : contains all the 4th level subdomains found

# Dependencies

The following tools are required for this script to work:

    Subfinder
    Assetfinder
    Amass

# Note

This script is designed to work on Linux-based operating systems. Please make sure that the required tools are installed before running the script.
