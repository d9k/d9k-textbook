# установка npm - nodejs packet manager

## Автодополнение не работает

http://askubuntu.com/questions/392200/npm-completion-broken

## Обновить

	sudo npm install -g npm

## Обновить node.js

	sudo npm install -g n

	sudo npm cache clean -f
	sudo npm install -g n
	sudo n stable

## Install exact version

- :speech_balloon: [node.js - Make \`npm install --save\` add a strict version to package.json | SO](https://stackoverflow.com/questions/30656189/make-npm-install-save-add-a-strict-version-to-package-json)

- `npm config set save-exact true`

manually: `npm install --save --save-exact my-module@my-specific-version`

## Conflict resolution

`package.json`:

```
   "overrides": {
     "foo": "1.0.0"
   }
```

- :speech_balloon: [package.json - npm equivalent of yarn resolutions? | SO](https://stackoverflow.com/questions/52416312/npm-equivalent-of-yarn-resolutions/67397982#67397982)