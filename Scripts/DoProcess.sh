#! /bin/bash
# Run in the logs collected directory. Combine all the separate log files
#  and create the analysis CSV file.

TOOLSDIR=/share/opensim/DSGToolkit/Scripts

EXPNAME=$(basename $(pwd))

echo "Creating 'Analysis' directory and doing combination."
$TOOLSDIR/CombineRaw.sh

cd Analysis
echo "Creating CSV datafile = ${EXPNAME}.csv"
$TOOLSDIR/DSGLogToolkit/ActivityByTime/bin/Debug/ActivityByTime.exe *.log
mv ActivityByTime.csv ${EXPNAME}.csv

