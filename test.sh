echo "test ansible container"

# start the container
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible

# create a hosts file with the correct IP address
export IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ansible`

rm -f hosts
echo "[ansible]" > hosts
echo "root@$IP" >> hosts

# run some ansible commands
echo 'ansible -i hosts ansible -m ping'
ansible -i hosts ansible -m ping
echo 'ansible -i hosts ansible -a "hostname"'
ansible -i hosts ansible -a "hostname"
echo 'ansible -i hosts ansible -a "uptime"'
ansible -i hosts ansible -a "uptime"

# stop the container
docker rm -f ansible 
 
