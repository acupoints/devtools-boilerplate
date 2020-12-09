# 如何使Nginx代理连接到Heroku SSL背后的Heroku应用程序
###########################################################################################
# 问题
# 您想让Nginx代理连接到Heroku SSL背后的Heroku应用程序，但它会像error:14094438:SSL routines:SSL3_READ_BYTES:tlsv1 alert internal error:s3_pkt.c:1262:SSL alert number 80SSL握手期间一样不断报告错误。这也适用于Private Spaces应用程序中使用的SNI证书。

# 解答
# Heroku SSL使用服务器名称指示（SNI）。nginx的配置与指定proxy_ssl_server_name on，并proxy_ssl_name与分配上Heroku的SSL端点的SSL服务器证书的自定义域名。

# 对于使用快速附加服务的用户，需要在后端的配置下将设置ssl_sni_hostname为在Heroku SSL端点上为SSL服务器证书分配的自定义域名。

# 这是/app/config/nginx.conf.erb与nginx buildpack一起使用的示例：
###########################################################################################
daemon off;
# Heroku dynos have at least 4 cores
worker_processes <%= ENV['NGINX_WORKERS'] || 4 %>;

events {
    use epoll;
    accept_mutex on;
    worker_connections <%= ENV['NGINX_WORKER_CONNECTIONS'] || 1024 %>;
}

http {
    gzip on;
    gzip_comp_level 2;
    gzip_min_length 512;
    server_tokens off;

    log_format main '$time_iso8601 - $status $request - client IP: $http_x_forwarded_for - to $upstream_addr - upstream status: $upstream_status, upstream_response_time $upstream_response_time, request_time $request_time';
    access_log /dev/stdout main;
    # set the following to "debug" when diagnosing an issue
    error_log /dev/stdout notice;
    log_not_found on;

    include mime.types;
    default_type application/octet-stream;
    sendfile on;

    # Must read the body in 5 seconds.
    client_body_timeout <%= ENV['NGINX_CLIENT_BODY_TIMEOUT'] || 5 %>;

    # handle SNI
    proxy_ssl_server_name on;
    # resolver needs to be set because we're using dynamic proxy_pass
    resolver 8.8.8.8;

    upstream upstream_app_a {
        server app-a.herokuapp.com:443;
    }

    upstream upstream_app_b {
        server app-b.herokuapp.com:443;
    }

    server {
        listen <%= ENV["PORT"] %>;
        server_name _;

        location / {
            set $upstream upstream_app_a;
            proxy_pass https://$upstream;
            proxy_ssl_name app-a.herokuapp.com;
            proxy_set_header x-forwarded-host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header Host app-a.herokuapp.com;
        }

        location /other {
            set $upstream upstream_app_b;
            proxy_pass https://$upstream;
            proxy_ssl_name app-b.herokuapp.com;
            proxy_set_header x-forwarded-host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header Host app-b.herokuapp.com;
        }
    }
}


