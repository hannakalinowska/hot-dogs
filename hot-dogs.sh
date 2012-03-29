#! /bin/sh
stall="Big Apple Hot Dogs"

result=`curl http://www.eat.st/kings-cross/kings-cross-calendar.php 2>&1`
today=`date +"%e(?:st|nd|rd|th) %h %Y"`
tomorrow=`date -v+1d +"%e(?:st|nd|rd|th) %h %Y"`
result=`echo $result | grep -oP "eat.st at King's Boulevard on $today|$stall|eat.st at King's Boulevard on $tomorrow" | head -n 2 | tr "\\n" " "`

if [[ -z $(echo $result | grep -P "$today") ]]
then
  echo "No eat.st today!"
elif [[ -n $(echo $result | grep -P "$stall") ]]
then
  echo "YES!"
else
  echo "No :("
fi
