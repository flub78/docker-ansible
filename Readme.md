# flub78/ansible

Minimal container to be provisionned by ansible.

## Build
```
docker build -t flub78/ansible .
```

## Usage
to start it
```
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible
```

to stop it
```
docker kill ansible
docker rm -f ansible
```

once the container is running, it can be accessed through ssh
```
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible
ssh root@$IP
```
or ansible

add the following lines to /etc/ansible/hosts
```
[ansible]
root@172.17.0.1
```

```
ansible ansible -m ping

frederic@frederic-VirtualBox ~/flub78/docker/flub78/ansible $ ansible ansible -a "hostname"
root@172.17.0.1 | success | rc=0 >>
5402140279af

frederic@frederic-VirtualBox ~/flub78/docker/flub78/ansible $ ansible ansible -a "uptime"
root@172.17.0.1 | success | rc=0 >>
 19:31:32 up  1:32,  1 user,  load average: 0.09, 0.16, 0.15
```

if the container is built again, its ssh key mustbe removed from the known hosts:
```
ssh-keygen -f "/home/frederic/.ssh/known_hosts" -R 172.17.0.1
```
