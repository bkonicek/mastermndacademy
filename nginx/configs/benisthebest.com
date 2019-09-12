server {
        listen 80;
        listen [::]:80;

        root /var/www/benisthebest.com/html;
        index index.html index.htm;

        server_name benisthebest.com www.benisthebest.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
