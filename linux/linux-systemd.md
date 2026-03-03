# Linux: systemd

## systemd show dependencies

:speech_balloon: [Disable autostart of docker-compose project | SO](https://stackoverflow.com/questions/41036273/disable-autostart-of-docker-compose-project)

```bash
systemctl show -p Requires,Wants,Requisite,BindsTo,PartOf,Before,After docker
```
