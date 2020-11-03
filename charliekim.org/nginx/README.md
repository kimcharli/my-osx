
## backup

```
ssh ckim-ubuntu tar zcf - /etc/nginx/sites-available | tar zxf -
```

## update

```
tar zcf - etc/nginx/sites-available | ssh ckim-ubuntu sudo tar zxf - -C / 
ssh dkim-ubuntu sudo systemctl restart nginx
```






