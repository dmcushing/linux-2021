echo -n "Enter your email address: "
read mailaddy

read -p "Send test mail? (y/n) "
[ "$REPLY" != "y" ] || curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data '{"personalizations": [{"to": [{"email": "'"$mailaddy"'"}]}],"from": {"email": "dave@davecushing.ca"},"subject": "CET1025 Test Email","content": [{"type": "text/plain", "value": "This is a test."}]}'
