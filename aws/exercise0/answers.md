## Basic VPC

#### Public subnet instance
1. Launch an instance with a public ip address into the public subnet.
2. log into the instance an update the software and attempt to install a new piece of software. i.e. `ngrep`

* Are you able to access the instance?
* How were you able to access the instance?
  * Yes I accessed the instance in the public subnet  via ssh
  * I accessed the instance in the private subnet by ssh using the instance in the public subnet as a bastion host 
  
* Are you able to install your software? Why? Why not?
  * im able to install software on the instance in the public subnet because there is a route to the public subnet 
  * I cannot do so on the private subnet because it has not route to the internet gateway in its route table 


#### Private subnet instance
1. Launch an instance into a private subnet.
2. log into the instance an update the software and attempt to install a new piece of software. i.e. `ngrep`

* Are you able to access the instance?
* How are you able to access the instance?
  * same as above 
* Are you able to install software? Why? Why not?
  * Same reason as above for the instance in the public subnet
  * For the instance in the private subnet, the added NAT gateway in the public subnet provides a route to the internet gateway for all outgoing traffic. So I am now able to update software ont he container.