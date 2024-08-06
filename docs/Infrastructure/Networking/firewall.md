# Firewall configurations

All traffic on ports 80 and 443 is sent to 3 different physical hosts using a simple round robin load balancer.

Traffik proxy is configured to manage the traffic further and send the requests to the required host/service and port.