λ scp 4803322_fy1m.cn_nginx.zip root@47.113.207.82:/usr/local/nginx
root@47.113.207.82's password:
4803322_fy1m.cn_nginx.zip
-------------
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ps -ef | grep nginx
root       64517       1  0 07:18 ?        00:00:00 nginx: master process /usr/local/nginx/sbin/nginx
nobody     64518   64517  0 07:18 ?        00:00:00 nginx: worker process
root       65017   64854  0 11:16 pts/1    00:00:00 grep --color=auto nginx
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64517
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64518
-bash: kill: (64518) - No such process
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ps -ef | grep nginx
root       65022   64854  0 11:17 pts/1    00:00:00 grep --color=auto nginx
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ls
client_body_temp  conf  fastcgi_temp  fy1m_cert  html  logs  proxy_temp  sbin  scgi_temp  uwsgi_temp
