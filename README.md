# nginx-no-logging-for-uptimerobot

hide uptimerobot requests from your nginx logs

Uptimerobot will access your website every minute, thereby polluting your nginx access logs.

This repo provides nginx rules so that logging is stopped for requests coming from uptimerobot ip ranges.


Luckily uptimerobot shares their IP ranges at https://uptimerobot.com/inc/files/ips/IPv4andIPv6.txt

Conditional logging in nginx can be achieved like explained in this tutorial: https://gock.net/blog/2020/nginx-variables-conditional-logging

```
map $remote_addr $log_enable {
    "192.168.4.1" 0;
    "192.168.4.2" 0;
    "192.168.4.3" 0;
    "192.168.4.4" 0;
    default 1;
}
```

Run `download-ip-list-convert-to-nginx-rule.sh` to download latest ip list and generate the rules or just use the rules from `nginx-hide-uptimerobot-requests.conf`.