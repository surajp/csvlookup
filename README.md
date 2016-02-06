# csvlookup
Bash + AWK script for quick Vlookups using CSV files. Ideal for large data sets
The main script is lookup.sh, which will give you the list of arguments the script expects
For best results, keep the data files in the same directory as the scripts

Author: Suraj Pillai
Date: 5th Feb, 2016





How to run:
	a) Copy the scripts to a folder on a Linux machine 
	b) Copy the csv files, both the data file and the lookup file to the same folder
	c) Provide execute permissions to lookup.sh and processcsv.sh by running the commands:
		i) chmod +x lookup.sh
		ii) chmod +x processcsv.sh
	d) Run lookup.sh ( ./lookup.sh). This will give you the list of arguments the script expects. Run the script again with the correct arguments to do the vlookup.
	e) The script will add the lookup data as the last column of the input data file, with the column name provided by the user
