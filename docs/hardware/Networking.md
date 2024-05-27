I was trying to keep it as simple as possible, so all traffic is routed through an ethernet cable to an ethernet repeater which is connected to a wireless repeater. A port on this repeater is used to connect the uplink of a firewall which administer all the traffic
All traffic coming to the router is sent to 3 different physical hosts using a simple round robin load balancer.
Traffik proxy is configured to manage the traffic further and send the requests to the required host and port.


devices:
Normal router (access point so no one gets mad :D) 
Ethernet repeater
Wireless repeater
Draytek firewall
Dell managed switch
two unmanaged switches

