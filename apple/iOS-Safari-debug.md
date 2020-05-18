# Debugging iOS Safari

# На Ubuntu

(tested with iOS 13)

https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter

Перед началом работы с ней нужно установить другую утилиту.
https://github.com/google/ios-webkit-debug-proxy/ (первая утилита запускает вторую и оборачивает её вывод, чтобы он был понятен Chrome):

Далее нужно запустить `remotedebug-ios-webkit-adapter` в режиме отладки:

```
npm install
DEBUG=remotedebug npm start
```

и смотреть открываемые порты в консоли.

В `chrome://inspect/#devices` кликнуть `Discover network targets` и добавлять `localhost со всеми обнаруженными портами.


Для установки последней версии утилиты `ios-webkit-debug-proxy` на Ubuntu понадобилось удалить старые версии библиотек `"libimobile*" "libusbmuxd" "usbmuxd*" "libplist*"` и скомпилировать из исходников новые в следующем поряден:

https://github.com/libimobiledevice/libplist
https://github.com/libimobiledevice/libusbmuxd
https://github.com/libimobiledevice/libimobiledevice
https://github.com/libimobiledevice/usbmuxd

# Сертификаты для браузера в iOS

https://github.com/webpack/webpack-dev-server/issues/1370#issuecomment-423867493

(tested with iOS 13)

1) сгенерировать сертификаты

```
mkcert --install
mkcert 192.168.86.42 localhost 127.0.0.1 0.0.0.0
```

2) любым способом отправить `~/.local/share/mkcert/rootCA.pem` и `192.168.86.42+3.pem` на телефон, установить (открыть, установить, зайти в настройки, уведомления сверху, подтвердить установку)

3) `General -> About -> Certificate Trust Settings` -> `Enable full trust for root certificate`

NOTE: `mkcert --install` также устанавливает корневой сертификат для Chrome и Firefox компьютера, на котором была запущена.

## Про генерацию корневого сертификата без mkcert (способ не заработал)

https://stackoverflow.com/questions/7580508/getting-chrome-to-accept-self-signed-localhost-certificate/60516812#60516812

## Способ от Михаила

я бы сделал так, поднял у себя локальный DNS сервис, в нем прописал некое доменное имя для которого есть нормальный валидный сертификат и указал его на свой же IP. в свойствах WiFi подключения IOS задал бы в качестве DNS сервера свой адрес
