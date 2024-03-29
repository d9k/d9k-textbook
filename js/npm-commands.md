# Команды npm

## Базовые

Any package can be installed by using
`npm install`

Display the package list globally installed

`npm list -g`
[туториал по установке coffee-script и прочего](http://julienrenaux.fr/2013/05/16/how-to-install-node-js-coffeescript-less-and-uglify-js-on-ubuntu/)

## Обновление пакетов

`npm outdated` покажет список.
`npm install --save-dev <package_name>` или `npm install --save <package_name>` (в зависимость от секции в package.json, куда установлен пакет)

## Strict use

## Доступные версии пакета

`npm show react-native versions --json`

## Установить последнюю новую beta-версию пакета

`npm i html-webpack-plugin@next`

## Тестировать модули npm online

http://requirebin.com/

```
satisfy = require("satisfy.js");
console.log(satisfy('span[innerHTML="item 2"]')[0].outerHTML)
```

открыть DevTools [F12]

## npm install from github

`npm install --save visionmedia/express#branch`
`npm install --save https://github.com/Amitesh/gulp-rev-all/tarball/master`
`git+https://github.com/visionmedia/express.git`
`git+ssh://git@github.com/visionmedia/express.git`

https://stackoverflow.com/questions/17509669/how-to-install-an-npm-package-from-github-directly
