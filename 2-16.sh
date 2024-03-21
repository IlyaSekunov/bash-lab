#!/bin/bash

# Help command
help="Generates users.csv file in format: <prefix>_<number>,<password>_<number>. Prefix is retrieved from standart input"
if [[ "$1" == "--help" || "$1" == "-h" ]]
then
echo $help
exit 0
fi

# Read first argument and check that this argument is not empty
users_count=$1
if [ -z $users_count ]
then
# If argument if empty print a message and exit the program
echo "first argument cannot be empty"
exit 0
fi

# Check that first argument is less than 0
if [ $users_count -le 0 ]
then
# If it is print a message and exit the program
echo "first argument cannot be less than 1"
exit 0
fi

# Read from standart input login prefix
echo "Enter a prefix of user login: "
read login_prefix

# Iterate users_count time and append a line to a file with user and generated password
for ((i = 1; i < $users_count; ++i))
do
	# Using pwgen generate one password
	user_password=$(pwgen --num-password=1)
	number=""
	if [ $i -lt 10 ]
	then
	number="0$i"
	else
	number="$i"
	fi
	
	# Append line to file users.csv
	echo "${login_prefix}_$number,${user_password}_$number" >> users.csv
done
exit 0 