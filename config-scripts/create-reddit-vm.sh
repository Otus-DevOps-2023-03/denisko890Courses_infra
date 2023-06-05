#!/bin/bash
yc compute instance create \
  --name reddit-full \
  --hostname reddit-full \
  --memory=2 \
  --create-boot-disk image-name=reddit-full-1685639738,name=disk1,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata  serial-port-enable=1 --zone ru-central1-a
