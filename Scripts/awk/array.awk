#!/bin/awk -f

# BEGIN{
#     arr[1]=1
#     arr[2]=2

#     arr1["Music"]="Baby"
#     arr1["Movie"]="Harry potter"

#     for(i in arr1){
#         print i ": " arr1[i]
#     }
# }

# BEGIN{
#     print "Number of arguments: " ARGC - 1
#     print "Name of the file: " ARGV[0]
#     for(i in ARGV){
#         if(i==0){
#             continue
#         }
#         print "Value at " i " is: " ARGV[i]
#     }
# }

BEGIN{
    for(i in ARGV){
        if(i==0) continue
        sum+=ARGV[i]
    }
    print "The sum of the inputted numbers is: " sum
}