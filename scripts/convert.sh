#!/bin/bash

### INSERT YOUR CODE BELOW ###
#input: a directory of DICOM files downloaded from NiDB, possibly containing subdirectories
#output: a directory of NIFTI files, organized in BIDS format
#method: script that can be run as
#	docker run [-v ...] rhancock/burc-lite <PATH>/convert.sh PARTICIPANT
#		[-v ...] replaced by appropriate options to attach parts of your local filesystem as volumes to container
#		<PATH>/convert.sh is path to script
#		PARTICIPANT is identifier for participant to convert. 
#		We downloaded IBRAIN002 (S0318ANN) from NiDB
PARTICIPANT=$1
#need to set dcmbids -d, -p(IBRAIN002), -c (the dcm2bids.json file), -o
#dcm2bids -d DICOM_DIR -p PARTICIPANT_ID -c CONFIG_FILE
#dcm2bids_scaffold [-o OUTPUT_DIR]
#	Create basic BIDS files and directories in the output directory (by default folder where the script is launched).
dcm2bids -d /bind/raw/$1 -p $1 -c /bind/scripts/dcm2bids.json -o /bind/bids/
### DO NOT MODIFY THE LINES BELOW ###
uname -a > info_host.txt
/usr/bin/env > info_env.txt
ls / > info_fs.txt
mount |grep ^/dev/ | grep -v /etc > info_volumes.txt
