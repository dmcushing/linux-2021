echo -n "Enter your first name: "
read fname
echo -n "Enter your last name: "
read lname
echo -n "Enter your email address: "
read mailaddy
fname=`echo $fname | sed 's/ /_/g'`
lname=`echo $lname | sed 's/ /_/g'`

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{"personalizations": [{"to": [{"email": "'"$mailaddy"'"}],"cc": [{"email":"dave@davecushing.ca"}]}],"from": {"email": "dave@davecushing.ca"},"subject": "'"Email from $fname $lname"'","content": [{"type": "text/plain", "value": "This is a test."}]}'
