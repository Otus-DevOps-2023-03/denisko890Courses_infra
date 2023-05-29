# denisko890Courses_infra
denisko890Courses Infra repository

# HW 6
testapp_IP = 158.160.104.40
testapp_port = 9292

Command for init VM and run command for deploy reddit.

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata  serial-port-enable=1 --zone ru-central1-a --metadata-from-file user-data=startup-script.yaml
```

# HW 5
Config ~/.ssh/config
```
Host bastion
   Hostname 158.160.98.107
Host someinternalhost
   Hostname 10.128.0.17
```

Use for connection:

```
 ~  ssh -J bastion someinternalhost
The authenticity of host '10.128.0.17 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:u7ncK6e86miIS/LuMMuVOrK1P+6tRFTRqF+zGsdAwxg.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.128.0.17' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-148-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Thu May 25 13:32:47 2023 from 10.128.0.30
denisko@someinternalhost:~$ ^C
denisko@someinternalhost:~$ logout
Connection to 10.128.0.17 closed.
```

Additional exercise

Added Proxy_Jump for the connection with bastion host.
Config ~/.ssh/config
```
Host bastion
   Hostname 158.160.98.107
Host someinternalhost
   Hostname 10.128.0.17
   ProxyJump bastion
```


```
ssh someinternalhost
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-148-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Thu May 25 13:44:36 2023 from 10.128.0.30
denisko@someinternalhost:~$
```

bastion_IP = 158.160.98.107
someinternalhost_IP = 10.128.0.17
