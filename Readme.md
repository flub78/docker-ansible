# flub78/ansible

Minimal container to be provisionned by ansible.

## Build
```
docker build -t flub78/ansible .
```

## Usage
to start it, be sure that the file id_rsa.public is owned by root with no read permission to others.

```
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible
```

to stop it
```
docker kill ansible
docker rm -f ansible
```
export IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ansible`
once the container is running, it can be accessed through ssh
```
docker run -d --name=ansible -v $HOME/.ssh/id_rsa.public/:/root/.ssh/authorized_keys flub78/ansible
ssh root@$IP
```
or ansible

```
~/docker/containers/ansible $ ./test.sh 
test ansible container
d4622734c810f4111f5c81c68df8c568ce6db6831705b14e2fbebbf0c8207b1e
ansible -i hosts ansible -m ping
root@172.17.0.4 | success >> {
    "changed": false, 
    "ping": "pong"
}

ansible -i hosts ansible -a "hostname"
root@172.17.0.4 | success | rc=0 >>
d4622734c810

ansible -i hosts ansible -a "uptime"
root@172.17.0.4 | success | rc=0 >>
 01:13:01 up 83 days,  4:38,  1 user,  load average: 0.16, 0.18, 0.15

ansible
```


if the container is built again, its ssh key must be removed from the known hosts:
```
ssh-keygen -f "/home/frederic/.ssh/known_hosts" -R 172.17.0.1
```
