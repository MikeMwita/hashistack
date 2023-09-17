#!/bin/bash
echo " ..... configuring consul permission on tls certificate ......"

chown --recursive consul:consul /opt/consul &&
chown --recursive consul:consul /etc/consul.d &&
chmod 640 /etc/consul.d/consul.hcl &&
chown consul:consul /etc/consul.d/consul.certificates

sudo chown -R app2:consul /etc/consul.d/



# correct consul server cery permission
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-server-consul-1-key.pem 
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-server-consul-2-key.pem 
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-server-consul-3-key.pem 

 
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-client-consul-1-key.pem 
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-client-consul-2-key.pem 
sudo chmod 755 /etc/consul.d/filtronic-hq-dc1-client-consul-3-key.pem

sudo chmod 755 /etc/letsencrypt/live/
sudo chmod 755 /etc/letsencrypt/archive/

# Correct permission for consul
 sudo chmod 755 /etc/consul.d/