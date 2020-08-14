export GROUP=coreweb_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=contentweb_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=loginweb_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=respweb_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=adminweb_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 


export GROUP=admingraphapi_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=graphapi_mt1 && for host in $(koala search resource group=$GROUP datacenter=n9 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
