#!/bin/bash
alldone="n"
while [ $alldone != [Yy] ]
do
	clear
	echo -n "Enter INSTRUCTOR email address: "
	read inmailaddy
	echo -n "         Enter your first name: "
	read fname
	echo -n "          Enter your last name: "
	read lname
	echo -n "      Enter YOUR email address: "
	read mailaddy
	echo -n " "
	echo -n "Instructor: $inmailaddy"
	echo -n " "
	echo -n " Your Name: $fname $lname"
	echo -n " Your Email: $mailaddy"
	echo -n " "
	echo -n "Correct? [y|n]? "
	read alldone
done

fname=`echo $fname | sed 's/ /_/g'`
lname=`echo $lname | sed 's/ /_/g'`

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{"personalizations": [{"to": [{"email": "'"$mailaddy"'"}],"cc": [{"email":"dave@davecushing.ca"}]}],"from": {"email": "dave@davecushing.ca"},"subject": "'"Email from $fname $lname"'","content": [{"type": "text/plain", "value": "This is a test."}]}'
