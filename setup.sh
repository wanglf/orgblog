#install jekyll
yum -y install ruby ruby-devel rubygems
gem install jekyll

# www.wanglifeng.info
git clone git@github.com:/wanglf.github.io /var/www/www.wanglifeng.info
cd /var/www/www.wanglifeng.info
jekyll build && jekyll serve

# install puborg
git clone git@github.com:/linux-setup.git ~/git/linux-setup.git
cd ~/git/linux-setup.git
make install

# publish orgfiles
cd ~/git/orgblog.git
make posts

# nginx
cat << 'EOF' > /etc/nginx/conf.d/jekyll.conf 
server {
  listen       8888;
  server_name  www.wanglifeng.info;

  charset utf-8;
  access_log  /var/log/nginx/jekyll.access.log  main;

  location / {
    proxy_pass   http://127.0.0.1:4001;
  }

  error_page   500 502 503 504  /50x.html;
  location = /50x.html {
    root   /usr/share/nginx/html;
  }
}
EOF
