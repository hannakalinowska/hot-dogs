#! /bin/sh
stall="Big Apple Hot Dogs"

result=`curl http://www.eat.st/kings-cross/kings-cross-calendar.php 2>&1`
today=`date +"%e(st|nd|rd|th) %h %Y"`
tomorrow=`date -v+1d +"%e(st|nd|rd|th) %h %Y"`
result=`echo $result | grep -oP "eat.st at King's Boulevard on ?$today|$stall|eat.st at King's Boulevard on ?$tomorrow" \
  | head -n 2 \
  | tr "\\n" " " \
  | sed -E "s/^eat.st at King's Boulevard on ?$today $stall.*$/YES/g" \
  | sed -E "s/^eat.st at King's Boulevard on ?$today eat.st at King's Boulevard on ?$tomorrow.*$/No/" \
  | sed -E "s/^eat.st at .+$/No eat.st today/" \
  `
echo $result
