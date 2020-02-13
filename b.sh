#!/bin/bash


ip=$1
FILE=/home/ec2-user/id_rsa.pub
if ssh -i /home/ec2-user/mynewkp.pem ec2-user@$ip "[ -f $FILE ]"
then	
	scp  -i mynewkp.pem /home/ec2-user/.ssh/id_rsa.pub ec2-user@$ip:/home/ec2-user/
        ssh -i mynewkp.pem ec2-user@$ip "cat  id_rsa.pub >> .ssh/authorized_keys && rm -rf id_rsa.pub"
        echo "Connected to Host $ip"
	   # echo "Action"
else
	scp  -i mynewkp.pem /home/ec2-user/.ssh/id_rsa.pub ec2-user@$ip:/home/ec2-user/
	ssh -i mynewkp.pem ec2-user@$ip 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwGYWed1w3CX4JNZA/jSScXBVXtKJ1brfqEH2HOKSDeIo7pbGOmcjMdKOcB4+EKsNq8KRMhtNZBxiYQ3sA3FlgHR15d0zJotbEsYSECUScVqn6EjHsm8l7ueO1/Bpx/N2N4d/oUYtuU7z+zd6NwdvNXVhsMn1w1kPZYdBAzEAvHojRHk2WsxXgBSKBnehnwJa6p8SjHifo6yCBY0V7+0xqghiR6/o1reJI52w4A0QLkb3URFZ2WO2IhFrN6h713mG1eAd4fderdDU7PAHxiAhqS1zTR2Rg79Ys+soVkX2KltC2bTuFSn8q6K/GtxegoOGA+vP2Lw/prytE0GEPPKVj mynewkp" > .ssh/authorized_keys'
	ssh -i mynewkp.pem ec2-user@$ip "rm -rf /home/ec2-user/.ansible"
	echo "Not Connected to Host $ip"
fi	
   





