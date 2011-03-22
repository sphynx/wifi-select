"wifi-select" is a console tool for selecting wireless networks in "real-time"
(in NetworkManager manner). The tool is convenient for use in Internet cafés or
other places you are visiting for the first (and maybe the last) time. Using
"wifi-select" you do not need to create a profile for a new network, just type
"sudo wifi-select wlan0" and choose the network you need. The tool is currently
packaged and available in [community] ArchLinux repository. To install it,
please run:

    # pacman -S wifi-select

wifi-select does the following:

* parses iwlist scan results and presents list of networks along with its
  security settings (WPA/WEP/none) using dialog
  
* if user selects network with existing profile -- just use this profile to
  connect with netcfg
  
* if user selects a new network (for example, WiFi hotspot), wifi-select
  automatically generates new profile with corresponding $SECURITY and asks for
  the key (if needed). It uses DHCP as $IP by default
  
* if connection succeeds, profile is saved for later usage

* if connection fails, user is asked if he/she wants to keep generated profile
for further usage (for example to change $IP to static or adjust some additional
options)

Links:

* ArchLinux [Forum][] thread related to development of wifi-select
* wifi-select in the [AUR][]
* section in [ArchLinux wiki][wiki] page

[forum]: http://en.wikipedia.org/wiki/Chapayev_%28game%29
[aur]:   http://raphaeljs.com
[wiki]:  http://knockoutjs.com
