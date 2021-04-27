export GROUP=coreweb_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=contentweb_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=loginweb_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=respweb_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=smadminweb_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 


export GROUP=admingraphapi_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
export GROUP=graphapi_mt3 && for host in $(koala search resource group=$GROUP datacenter=w8 -f id); do echo $host; ssh -oStrictHostKeyChecking=no $host 'sudo docker restart $(sudo docker ps -a -q)'; done 
