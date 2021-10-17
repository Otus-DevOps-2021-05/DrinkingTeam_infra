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

# Дз 6
testapp_IP = 62.84.113.90
testapp_port = 9292

Cкрипт, который все создает, устанавливает и запускает (см. также файл metadata.yml)
```
yc compute instance create \
  --name reddit-app2 \
  --hostname reddit-app2 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=metadata.yml
```

# Дз 7
Создан json для формирования образа и проведено тестовое создание вм.

# Дз 8
Добавлены конфигурационные файлы terraform для разворачивания инфраструктуры

# Дз 9
Добавлены модули в конфигурацию terraform и сделано разделение на контура

# Дз 10
Созданые простые плейбуки и инвентори для ансибла

# Дз 11
Созданы плейбуки для конфигурования reddit-app и монги
Созданы провижонеры на ansible для пакера

# Дз 12
Плейбуки организованы в соответствие с бестпрактисами
