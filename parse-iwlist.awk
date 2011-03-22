BEGIN { FS=":"; OFS="="; }
/\<Cell/ {
    # new cell description has started, so we need to print previous one.
    # detect security mode first.
    if (wpa) { security="wpa" } else { if (wep) { security = "wep" } else {security = "none" }}
    if (essid) print essid, security, quality;
    # reset security flags
    wep=0; wpa=0; 
}
/\<ESSID:/ { essid=substr($2, 2, length($2) - 2) } # discard quotes
/\<Quality/ {
    split($1, q, "[=/]");
    if (q[2]) { quality=q[2] } else { split($2, q, "/"); quality=q[1] }
}
/\<Encryption key:(o|O)n/ { wep=1 }
/\<IE:.*WPA.*/ { wpa=1 }
END {
    # handle last cell
    if (wpa) { security="wpa" } else { if (wep) { security = "wep" } else {security = "none" }}
    if (essid) print essid, security, quality;
}
