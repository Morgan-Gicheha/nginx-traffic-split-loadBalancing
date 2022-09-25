# nginx-traffic-split-loadBalancing

## Proxying HTTP Traffic to a Group of Servers sample

```
http {
    upstream backend {
        server backend1.example.com weight=5;
        server backend2.example.com;
        server 192.0.0.1 backup;
    }
}
```

### proxying to the above named servers

```
server {
    location / {
        proxy_pass http://backend;
    }
}
```


### combination of the above two

```
http {
    upstream backend {
        server backend1.example.com;
        server backend2.example.com;
        server 192.0.0.1 backup;
    }
    
    server {
        location / {
            proxy_pass http://backend;
        }
    }
}
```

