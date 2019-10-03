# What is this?
`domainage.sh` is a script which checks how old a domain is using a whois lookup. A DNS request for a domain which has only been around for a few days is a useful indicator of potential mallicious activity. It isn't intended in it's current form to be more than a simple proof of concept.

This script should be relatively portable for most linux distributions. The concept should also be relatively easy to translate into other scripting languages to integrate with your favorite flavor of SIEM or automation/orchestration toolkit.

# How to use this script
Install the requisite package `whois` using your favorite package manager, e.g.
```
foo@bar:~# apt install whois
```

Make sure that you have execution rights for the script or the ability to launch a shell, e.g.
```
foo@bar:~# chmod ug+x domainage.sh
foo@bar:~# ./domainage google.com
Domain google.com is 8053 days old.
```
