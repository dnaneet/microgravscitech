#!/bin/bash
#set -x
#shopt -s xpg_echo
#Batch convert eps to pdfs and crop resulting pdf files

#--------------------------------------------------
#Author: D N Aneet Wed 17 Apr 2013 05:56:48 PM EDT
#Running this bash script via terminal in a folder
#will convert all .eps files in that folder to .pdf
#It will also crop any white space out of the 
#resulting pdf file. Useful for plots that might
#have a lot of white space. 
#--------------------------------------------------

#Counts number of .eps files in the current folder
fileNum=$(ls -l *.eps | wc -l)

#Creates a file called 'epsfiles.list' and appends
#to it the .eps file names
ls *.eps > epsfiles.list
#awk 'NR=='$1 './epsfiles.list'
for i in $(eval echo {1..$fileNum})
do

#Converts .eps files to .pdf files with the same filename
file=$(awk 'NR=='$i './epsfiles.list')
epstopdf $file

done

ls *.pdf > pdffiles.list
fileNum=$(ls -l *.pdf | wc -l)
for j in $(eval echo {1..$fileNum})
do

file=$(awk 'NR=='$j './pdffiles.list')
#Crops all white space out of pdf files. 
#Cropped files are saved with a `-crop` suffix.
pdfcrop $file

done


