BEGIN { FS=":"; OFS="="; }
/\<Cell/ { if (essid) print essid, security, quality[2]; security="none" }
/\<ESSID:/ { essid=substr($2, 2, length($2) - 2) } # discard quotes
/\<Quality=/ { split($1, quality, "[=/]") }
/\<Encryption key:on/ { security="wep" }
/\<IE:.*WPA.*/ { security="wpa" }
END { if (essid) print essid, security, quality[2] }
