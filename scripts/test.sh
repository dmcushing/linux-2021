username='sheldon'
if grep -q -E "^university:.*[:,]$username(,.*|\b)" /etc/group; then
    echo 'true'
else
    echo 'false'
fi
