#### Domain: Network Security

**Question 1:  Faulty Firewall**

Suppose you have a firewall that's supposed to block SSH connections, but instead lets them through. How would you debug it?


​
	We have a firewall that is supposed to block ssh connections, but instead of that lets them through, as a result we need to debug it.
	
In Project 1 we created multiple virtual machines in a virtual network, but while most of them allowed for access via SSH, because of the network

security groups they only accepted ssh connections from certain sources.

The Jump-Box virtual machine accepted ssh connections from our local machines public IP, and could connect via ssh to our Webserver machines and 

ELK server on the virtual networks we created

   
	If you try to connect to a Virtual Machine that does not accept SSH connections or try to connect with a IP address that has not been whitlisted

then if the system has been configured properly then you should recieve an error or just have your connection refused.

If one of my Project 1 VMs accepted SSH connections incorrectly, I would assume the source of the error lies in a misconfiguration of the network

security groups as SSH is associated with the network layer of the OSI model.

I would start off with my inbound security rules in my network security group, most likely there would be a misconfiguration in there preventing 

expected connections or allowing unwanted connections, if it is not the security group I would then check the SSH keys used for access to the systems.    

Once changes are made to the network security group, testing the changes are as simple as attempting to SSH into the machine you are attempting to reach.
		

	The Network security groups and Virtual Machine panes of the Azure UI would be the first place to look at to investigate any issues that arise.	

The first place to look would be the inbound security rules for the network security group if it is a network issue, if it is an authorization issue then

it might be in the virtual machine pane section dealing with SSH keys.

One should look for misconfigured rules i.e. incorrect source or destination IP's, incorrect priorities set, proper protocol use. If it is an authorization issue

then one should to see if the correct isa file is used and if the ssh keys are from the correct machine.

as mentioned before in this document one way to test that the fix is effective to simply attempt to connect via SSH.


	No one solution can guarantee that a network is "immune" to all unathorized access, even a multitude of solutions cannot guarantee that, what it can do

is help minimize the exposure a network has to the outside world, decrease the area needed to monitor and decrease the risk of a breach.

As for any additional monitoring controls that could be added to ensure that any suspicous authentication attempts are identified, one can examine the system logs

in the associated ELK server.