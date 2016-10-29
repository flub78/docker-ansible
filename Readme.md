# ansible-target

Minimal container to be provisionned by ansible.

## Usage
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys ansible-target

once the container is running, it can be accessed through ssh

ssh root@172.17.0.1

or ansible

add the following lines to /etc/ansible/hosts

[ansible]
root@172.17.0.1

ansible ansible -m ping

frederic@frederic-VirtualBox ~/flub78/docker/ansible-target $ ansible ansible -a "hostname"
root@172.17.0.1 | success | rc=0 >>
5402140279af

frederic@frederic-VirtualBox ~/flub78/docker/ansible-target $ ansible ansible -a "uptime"
root@172.17.0.1 | success | rc=0 >>
 19:31:32 up  1:32,  1 user,  load average: 0.09, 0.16, 0.15


if the container is built again, its ssh key mustbe removed from the known hosts:
ssh-keygen -f "/home/frederic/.ssh/known_hosts" -R 172.17.0.1

