#!/bin/bash
alldone="n"
while [[ $alldone != [Yy] ]]
do
	clear
	echo $alldone
	echo -n "Enter INSTRUCTOR email address: "
	read inmailaddy
	echo -n "     Enter your student number: "
	read snumber
	echo -n "         Enter your first name: "
	read fname
	echo -n "          Enter your last name: "
	read lname
	echo -n "      Enter YOUR email address: "
	read mailaddy
	echo -e " "
	echo -e "Instructor: $inmailaddy"
	echo -e " "
	echo -e "  Your Name: $fname $lname"
	echo -e " Your Email: $mailaddy"
	echo -e " "
	echo -n "Correct? [y|n]? "
	read alldone
done

fname=`echo $fname | sed 's/ /_/g'`
lname=`echo $lname | sed 's/ /_/g'`

cat << EOF > ~/.info/.info
Name:$fname $lname
FName:$fname
LName:$lname
Email:$mailaddy
Student:$snumber
Instructor:$inmailaddy
EOF

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{"personalizations": [{"to": [{"email": "'"$mailaddy"'"}],"cc": [{"email":"'"$inmailaddy"'"}]}],"from": {"email": "'"$inmailaddy"'"},"subject": "'"Email from $fname $lname"'","content": [{"type": "text/plain", "value": "This is a test."}]}'
