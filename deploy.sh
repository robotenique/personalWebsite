#!/bin/bash
ssh_host="robotenique@linux.ime.usp.br"
ssh_destination="~/www/updated_site.zip"
rm -f updated_site.zip
jekyll build
zip -r updated_site.zip _site
echo "Opening ssh connection..."
scp -r updated_site.zip $ssh_host:$ssh_destination
echo ""
echo -n "Want to connect to the ssh destination (y/[N])? "
old_stty_cfg=$(stty -g)
stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty
if echo "$answer" | grep -iq "^y" ;then
    echo ""
    ssh $ssh_host
else
    echo ""
    echo "Finished deploy"
fi 2> /dev/null