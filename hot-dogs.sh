#! /bin/sh
curl http://www.eat.st/kings-cross/kings-cross-calendar.php 2>&1 | grep -oP "Big Apple Hot Dogs|eat.st at King's Boulevard on `date -v+1d +"%e(?:st|nd|rd|th) %h %Y"`" | head -n 1 | sed -E 's/Big Apple Hot Dogs/YES!/' | sed -E 's/eat.st.+/No :\(/'
