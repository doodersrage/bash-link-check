#!/bin/bash

SAVEFILE=results.txt
FILENAME=pages.txt
REPLACE="http://www.domain.com/"
NEWURL="http://newdomain.com/"
#clear output file
echo "Reponse   URL Redirect_URL" > $SAVEFILE
REDCNT=0
NTFNDCNT=0
OKCNT=0

for page in $(< $FILENAME)
do
    newlink=$NEWURL${page:${#REPLACE}}
    response=$(curl --write-out %{http_code} --silent --output /dev/null $newlink)
    # if 301 or 302 get redirect url
    if [[ $response = 301 || $response = 302 ]]; then
        newpage=$(curl --write-out %{url_effective} --silent --output /dev/null $newlink)
        let REDCNT++
    else
        newpage=''
    fi
    if [[ $response = 404 ]]; then
        let NTFNDCNT++
    fi
    if [[ $response = 200 ]]; then
        let OKCNT++
    fi
    # save to output file
    echo $response  $newlink    $newpage >> $SAVEFILE

done

echo Redirects: $REDCNT
echo 200 OK: $OKCNT
echo 404 not found: $NTFNDCNT
echo DONE!