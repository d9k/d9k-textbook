# DBeaver

`ctrl-p` - edit preferences

## Time zone

- :speech_balloon: [How to change DBeaver timezone / How to stop DBeaver from converting date and time | SO](https://stackoverflow.com/questions/45323552/how-to-change-dbeaver-timezone-how-to-stop-dbeaver-from-converting-date-and-ti)
- `Window -> Preferences -> User Interface -> Client Timezone: Etc/GMT (UTCZ)`

## Change tab title pattern

Preferences: `Editors -> SQL Editor -> Scripts`

https://dbeaver.io/forum/viewtopic.php?f=2&t=1649

## Dark sql editor background color

https://github.com/dbeaver/dbeaver/issues/1884

> @E1izabeth:
> Maybe you could try using Darkest Dark theme or Eclipse Color Theme extensions

https://marketplace.eclipse.org/content/darkest-dark-theme-devstyle
https://dbeaver.com/docs/wiki/Eclipse-extensions/

## Word wrap in SQL editor

Add

```
wordwrap.enabled=true
```

to

```
~/.local/share/DBeaverData/workspace6/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclipse.ui.editors.prefs
```