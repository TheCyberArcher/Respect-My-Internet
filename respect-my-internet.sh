 #!/bin/bash

####### DIRECTORIES ########

mkdir /home/$USER/TMP/
mkdir /home/$USER/Respect-My-Internet/
mkdir /home/$USER/Respect-My-Internet/Hagezi-Ultimate/
mkdir /home/$USER/Respect-My-Internet/CTI-Feeds/
mkdir /home/$USER/Respect-My-Internet/No-Google/
mkdir /home/$USER/Respect-My-Internet/No-Apple/
mkdir /home/$USER/Respect-My-Internet/No-Amazon/
mkdir /home/$USER/Respect-My-Internet/No-Track/
mkdir /home/$USER/Respect-My-Internet/No-Facebook/
mkdir /home/$USER/Respect-My-Internet/No-Microsoft/
mkdir /home/$USER/Respect-My-Internet/Red-Flag/
mkdir /home/$USER/Respect-My-Internet/Phishing-Army/
mkdir /home/$USER/Respect-My-Internet/OISD/
mkdir /home/$USER/Respect-My-Internet/REGEX/

####### BLOCKLISTS UPDATE + CONVERT ########

curl  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/ultimate.txt   >> /home/$USER/TMP/hagezi.tmp #HAGEZI-ULTIMATE
curl  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/tif.txt  >> /home/$USER/TMP/cti.tmp #CTI-FEEDS
curl  https://raw.githubusercontent.com/nickspaargaren/no-google/refs/heads/master/pihole-google.txt >> /home/$USER/TMP/no-google.tmp #NO-GOOGLE
curl  https://raw.githubusercontent.com/cedws/apple-telemetry/refs/heads/master/blacklist  >> /home/$USER/TMP/no-apple.tmp #NO-APPLE
curl  https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/facebook/all  >> /home/$USER/TMP/no-facebook.tmp #NO-FACEBOOK
curl  https://raw.githubusercontent.com/nickspaargaren/no-amazon/refs/heads/master/amazon.txt >> /home/$USER/TMP/no-amazon.tmp #NO-AMAZON
curl  https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/microsoft/all  >> /home/$USER/TMP/no-microsoft.tmp #NO-MICROSOFT
curl  https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt  >> /home/$USER/TMP/no-windows.tmp #NO-WINDOWS
curl  https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/notrack-blocklist.txt    >> /home/$USER/TMP/no-track.tmp #NO-TRACK
curl  https://dl.red.flag.domains/red.flag.domains.txt >> /home/$USER/TMP/red-flag-domains.tmp #RED-FLAG-DOMAINS
curl  https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild_big.txt >> /home/$USER/TMP/oisd-big.tmp #OISD-BIG
curl  https://phishing.army/download/phishing_army_blocklist_extended.txt >> /home/$USER/TMP/phishing-army.tmp #PHISHING-ARMY

cd /home/$USER/TMP/
printf "0.0.0.0 %s\n" $(cat hagezi.tmp) >> /home/$USER/Respect-My-Internet/Hagezi-Ultimate/hagezi.txt
printf "0.0.0.0 %s\n" $(cat cti.tmp) >> /home/$USER/Respect-My-Internet/CTI-Feeds/threat-intelligence-feeds.txt
printf "0.0.0.0 %s\n" $(cat no-google.tmp) >> /home/$USER/Respect-My-Internet/No-Google/no-google.txt
printf "0.0.0.0 %s\n" $(cat no-apple.tmp) >> /home/$USER/Respect-My-Internet/No-Apple/no-apple.txt
printf "0.0.0.0 %s\n" $(cat no-amazon.tmp) >> /home/$USER/Respect-My-Internet/No-Amazon/no-amazon.txt
printf "0.0.0.0 %s\n" $(cat no-track.tmp) >> /home/$USER/Respect-My-Internet/No-Track/no-track.txt
printf "0.0.0.0 %s\n" $(cat red-flag-domains.tmp) >> /home/$USER/Respect-My-Internet/Red-Flag/red-flag-domains.txt
printf "0.0.0.0 %s\n" $(cat oisd-big.tmp) >> /home/$USER/Respect-My-Internet/OISD/oisd-big.txt
printf "0.0.0.0 %s\n" $(cat phishing-army.tmp) >> /home/$USER/Respect-My-Internet/Phishing-Army/phishing-army.txt

mv /home/$USER/TMP/no-facebook.tmp /home/$USER/Respect-My-Internet/No-Facebook/no-facebook.txt
mv /home/$USER/TMP/no-microsoft.tmp /home/$USER/Respect-My-Internet/No-Microsoft/no-microsoft.txt
mv /home/$USER/TMP/no-windows.tmp /home/$USER/Respect-My-Internet/No-Windows/no-windows.txt

git clone https://github.com/TheCyberArcher/Respect-My-Internet/tree/main/rules /etc/opensnitchd/rules/
git clone https://github.com/TheCyberArcher/Respect-My-Internet/tree/main/regex /home/$USER/Respect-My-Internet/REGEX/
