#!/bin/bash

#print the file

# cat sample.txt


#print a given column

# awk '{print $4}' sample.txt

#print the last row or column

# awk '{print $NF}' sample.txt #for column
# awk 'NR==11{print $0}' sample.txt #for row

#search a word

# awk '/Lusa/{print $0}' sample.txt #for case sensitive
# awk 'BEGIN{IGNORECASE=1}/lusa|dari/{print NR, $0}' sample.txt #for case insensitive

#search a letter

# awk '/z/{print $0}' sample.txt

#replace a word

# awk -i inplace '{gsub("yopmail", "google")}' sample.txt #(-i inplace is used to edit the file also)

#to get the lenght of the fild/line

# awk '{print NR, length($2)}' sample.txt #length of column

# awk '{print length($0)}' sample.txt #lenght of line/row

#index/position of a word in a given line

# awk '/D/{print NR, index($0, "D")}' sample.txt #for a letter

# awk '/Dari/{print NR, index($0, "Dari")}' sample.txt #for a word

#to conver to upper case or lower case

# awk '{print tolower($4)}' sample.txt #for lowercase

# awk '{print toupper($4)}' sample.txt #for uppercase

#begin and end

# awk 'BEGIN{print "--------------DATA FROM HERE-----------------\n"} {print $0} END{print "\n-------------END--------------"}' sample.txt

#sum of salary

# awk 'BEGIN{sum=0} {sum+=$4} END{print "Sum of salary: " sum}' sample.txt

# awk '{sum+=$4} END{print "Sum of salary: " sum}' sample.txt

#fint the averge of the salary

# awk 'NR>1{if($NF>0)count++; sum+=$NF} END{print "Average of the salary: " sum/count}' sample.txt

#print number of lines

# awk 'END{print NR}' sample.txt

# awk 'NR>1 {if(NF>0)count++} END{print count}' sample.txt

#print the line having longest lenght and also print its length

# awk 'NR>1 {if(length($0)>max)max=length($0); if(length($0)==max)print($0)} END{print "Length of longest line is: " max}' sample.txt

#if salary>50000 print high else print low

# awk '{if(NF>0) if($NF>50000)$(NF+1)="HIGH"; else $(NF+1)="LOW"; print $0}' sample.txt

#filter salary and total on the basis of their department

# awk '{if($4=="Marketing")print $0} {if($4=="Marketing")sum+=$NF} END{print "The total sum of the salaries of Marketing people are: " sum}' sample.txt

#for another file(delimenator) eg csv

# awk -F, '{print $2}' sample.csv

# awk -F, '$NF=="Brazzaville"{print $0}' sample.csv