*Wifi-select* is a console tool for selecting wireless networks in "real-time"
(in NetworkManager manner). The tool might be convenient to use in Internet
cafés or other places you are visiting for the first (and maybe the last) time.
With "wifi-select" you do not need to create a profile for a new network, just
type "sudo wifi-select wlan0" and choose the network you need.

"wifi-select" is currently packaged and available in [community] ArchLinux
repository. To install it, please run:

    # pacman -S wifi-select

wifi-select does the following:

* parses iwlist scan results and presents list of networks along with its
  security settings (WPA/WEP/none) and signal quality using "dialog" tool
  
* if a user selects a network with existing profile -- uses this profile to
  connect with "netcfg"
  
* if the user selects a new network (which doesn't have a profile yet),
  wifi-select automatically generates new profile with corresponding $SECURITY
  and asks for the key (if needed). It uses DHCP as $IP by default
  
* if a network connection succeeds, profile is saved for later usage

* if a network connection fails, user is asked whether he/she wants to keep generated
  profile for further usage (for example to change $IP to static or adjust some
  additional options)

Links:

* ArchLinux [Forum][] thread related to development of wifi-select
* wifi-select in the [AUR][]
* section in [ArchLinux wiki][wiki] page

[forum]: https://bbs.archlinux.org/viewtopic.php?id=63973
[aur]:   http://aur.archlinux.org/packages.php?ID=23471
[wiki]:  https://wiki.archlinux.org/index.php/Netcfg#wifi-select
