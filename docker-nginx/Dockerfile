
FROM nginx:1.17-alpine

ADD ./html1  		     /usr/share/nginx/html1
ADD ./html2  		     /usr/share/nginx/html2
ADD ./html3  		     /usr/share/nginx/html3
ADD ./nginx.conf 	     /etc/nginx/nginx.conf
ADD ./ssl/ssl.crt      	     /etc/nginx/ssl/ssl.crt
ADD ./ssl/ssl.key            /etc/nginx/ssl/ssl.key
ADD ./ssl-params.conf        /etc/nginx/snippets/ssl-params.conf
ADD ./ssl/dhparam.pem        /etc/nginx/dhparam.pem 
ADD ./self-signed.conf       /etc/nginx/snippets/self-signed.conf
ADD ./bublik.conf           /etc/nginx/conf.d/bublik.conf

EXPOSE 8089
EXPOSE 443
EXPOSE 30443

CMD ["nginx", "-g", "daemon off;"]
