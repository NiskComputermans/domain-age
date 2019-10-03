#!/bin/bash -

## Sanity Checking
# ----------------
# Make sure that obvious failure cases are covered before attempting to run.

if [[ ! $1 ]]; then
				echo -e "\e[4;31mERROR: Specify a domain to test when running this script.\e[21;0m"
				exit 1
fi

# Test non-standard binaries are available.
if [[ ! $(which whois) ]]; then
				echo -e "\e[4;31mERROR: Please install whois using your package manager before running this tool.\e[21;0m"
				exit 1
fi

## Main
# -----
# Main code execution block.

# Calculate the date of registration in seconds. Whois dates are
#  presented in standard ISO 8601 date and time format which is directly
#  convertable by the inbuilt date utility.
domain_creation_date=$(whois $1 | egrep "^\s*Creation Date" | head -n 1 | sed -r 's_^\s+__' | cut -d\  -f3 | xargs -I{} date +%s --date "{}")

# Calculate the current date and time in seconds.
now=$(date +%s)

# Calculate the difference between the domain creation date and now.
time_difference=$(($now-$domain_creation_date))

# Convert the difference in seconds to a number of days.
domain_age=$(($time_difference/(3600*24)))

# Return the age of the domain.
echo "Domain $1 is $domain_age days old."
