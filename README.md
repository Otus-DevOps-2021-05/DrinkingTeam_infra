# DrinkingTeam_infra
DrinkingTeam Infra repository

bastion_IP = 178.154.252.236
someinternalhost_IP = 10.128.0.28

# FAQ

## Как подключиться к внутренниму хосту:
```
ssh -i ~/.ssh/appuser -A appuser@178.154.252.236 -t 'ssh 10.128.0.28'
```

## Как подключиться к внутренниму хосту (короткий вариант команды)
Чтобы заработала следующая команда:
```
ssh someinternal
```
требуется добавить следующий блок в файл ~/.ssh/config
```
Host someinternalhost
    HostName 178.154.252.236
    User appuser
    IdentityFile ~/.ssh/appuser
    RemoteCommand ssh 10.128.0.28
    ForwardAgent yes
    RequestTTY force
```
