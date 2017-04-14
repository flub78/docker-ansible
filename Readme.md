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
ed17a208efbfe43b0c5bedd1f041c30fb41fce631b2e7a1cc0b3d4767c9dcc04
$IP=172.17.0.4
root@172.17.0.4 | success >> {
    "changed": false, 
    "ping": "pong"
}

root@172.17.0.4 | success | rc=0 >>
ed17a208efbf

root@172.17.0.4 | success | rc=0 >>
 01:02:52 up 83 days,  4:28,  1 user,  load average: 0.21, 0.15, 0.15

ansible
```


if the container is built again, its ssh key must be removed from the known hosts:
```
ssh-keygen -f "/home/frederic/.ssh/known_hosts" -R 172.17.0.1
```
