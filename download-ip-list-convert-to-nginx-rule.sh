#!/bin/bash

url="https://uptimerobot.com/inc/files/ips/IPv4andIPv6.txt"

(
  # download list of ips
  curl "https://uptimerobot.com/inc/files/ips/IPv4andIPv6.txt" > ips.txt;

  # start of config
  echo 'map $remote_addr $log_enable {'

  # line for each ip
  cat ips.txt | tr -d "\r" | while read -r ip; do 
    echo "\"$ip\" 0;"; 
  done

  # end of config
  echo "default 1;";
  echo "}";
  echo;

  # config for access log
  echo 'access_log /var/log/nginx/nginx-access.log combined if=$log_enable;'
) | tee nginx-disable-logging-for-uptimerobot.conf