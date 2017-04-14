echo "test ansible container"

docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible
export IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ansible`
echo "\$IP=$IP"

rm -f hosts
echo "[ansible]" > hosts
echo "root@$IP" >> hosts

ansible -i hosts ansible -m ping
ansible -i hosts ansible -a "hostname"
ansible -i hosts ansible -a "uptime"

docker rm -f ansible 
 
