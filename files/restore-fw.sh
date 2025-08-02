#!/bin/bash

ipset restore -file /etc/ipset-whitelist.conf
sleep 5
iptables-restore < /etc/iptables.rules
