BEGIN { OFS = "="; } # OFS is a field separator used for "print"
/\<Cell/ {
    # New cell description has started, so we need to print a previous one.
    # Detect security mode first.
    if (wpa) { security = "wpa" } else { if (wep) { security = "wep" } else { security = "none" }}
    if (essid) print essid, security, quality;
    # Reset security flags.
    wep = 0; wpa = 0;
}
/\<ESSID:/ {
    split($1, essid_parts, ":");
    essid = essid_parts[2];
    essid = substr(essid, 2, length(essid) - 2)  # discard quotes
}
/\<Quality/ {
    # We should support several output formats from iwlist scan (from
    # wireless_tools package):
    #
    # 1) Quality:30/70
    # 2) Quality=20/100
    # 3) Quality:60
    #
    # Quality might be separated with '=' or with ':' and we might have maximal
    # value present or not. This depends on the driver used.
    #
    split($1, q, "[:=]"); # after split: q[1] -> "Quality", q[2] -> quality value
    split(q[2], qvalues, "/");
    if (qvalues[2]) {
        quality = int(qvalues[1] / qvalues[2] * 100); # we have both parts, divide
    } else {
        quality = qvalues[1]; # we have only one part, use it as-is
    }
}
/\<Encryption key:(o|O)n/ { wep = 1 }
/\<IE:.*WPA.*/ { wpa = 1 }
END {
    # handle last cell
    if (wpa) { security = "wpa" } else { if (wep) { security = "wep" } else { security = "none" }}
    if (essid) print essid, security, quality;
}
