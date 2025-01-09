#!/bin/bash
# Piping everything to penguinie.log otherwise some things don't make it through
exec > >(tee /tmp/penguinie.log) 2>&1
echo ------------------------------------------------------------------------
echo "|     Hello, this is Watchtower Forensic at manasseh.vm.wt.local!      |"
echo "|  I'm about to prepare your daily connection report, please wait...   |" 
echo "|       For nothing is hidden that will not become evident...          |"
echo ------------------------------------------------------------------------
today=$(date "+%Y-%m-%d")
thedayiwant=$(date -d "$today - 1 day" "+%Y-%m-%d")
echo "|   The date about to be analyzed is $thedayiwant                        |"
echo "|   I will analyze the top 75 hosts by bytes consumed on the network   |"
echo "|   Copying GNU-zip compressed logs...                                 |"
cp ~/Watchtower-Forensic-Datastore/$thedayiwant/conn.* ~/Watchtower-Reporting/Holding-Cell/
echo "|   Extracting GNU-zip compressed logs and deleting archives...        |"
gunzip ~/Watchtower-Reporting/Holding-Cell/*
echo "|   Concatenating all copied logs...                                   |"
cat ~/Watchtower-Reporting/Holding-Cell/*.log > WatchtowerDPIDailyLog.log
echo "|   Removing files from holding cell...                                |"
rm ~/Watchtower-Reporting/Holding-Cell/*
echo "|   Preparing log...                                                   |"
echo ------------------------------------------------------------------------
python3 ./trace-summary -b -n 75 -c ~/Watchtower-Reporting/WatchtowerDPIDailyLog.log
echo ------------------------------------------------------------------------
echo -   Cleaning up...   -
rm WatchtowerDPIDailyLog.log
echo -   Execution complete. Executing support script with cat and awk...    -
bash ~/Watchtower-Reporting/OutputToWatchtowerSOCDiscord.bash cat /tmp/penguinie.log | awk '!/^UID/'
# This is a script that runs a curl HTTP post to Discord. You can find many libre versions online. I had to modify mine to get it to work as intended.
