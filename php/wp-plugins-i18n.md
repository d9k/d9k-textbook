# WordPress: #plugin development: #i18n

## I18n for WordPress Developers « WordPress Codex

https://codex.wordpress.org/I18n_for_WordPress_Developers

## Introduction to Gettext

- Developers wrap translatable strings in special gettext functions
- Special tools parse the source code files and extract the translatable strings into POT (Portable Objects Template) files. In the WordPress world, POT files are often fed to GlotPress, which is a collaboration tool for translators
- Translators translate the strings and the result is a PO file (POT file, but with translations inside)
- PO files are compiled to binary MO files, which give faster access to the strings at run-time

## Make strings translatable

The most commonly used one is esc_html__(). It escapes and returns the translation of its argument:

## Translating Plugins and Themes

[wp i18n make-pot | WP-CLI Command | Developer.WordPress.org](https://developer.wordpress.org/cli/commands/i18n/make-pot/)

```bash
wp i18n make-pot source_dir
```

```bash
msgfmt -o <output>.mo <input>.po
```

## Loading Text Domain | How to Internationalize Your Plugin

https://developer.wordpress.org/plugins/internationalization/how-to-internationalize-your-plugin/#loading-text-domain

```php
load_plugin_textdomain( 'wpdocs_textdomain', false, dirname( plugin_basename( __FILE__ ) ) . '/languages' );
```

## Internationalization: You’re probably doing it wrong » Otto on WordPress

https://ottopress.com/2012/internationalization-youre-probably-doing-it-wrong/

The `_n` function is a translation function that picks the first string if the $number (third parameter to `_n`) is one, or the second one if it’s more than one. We still have to use the sprintf to replace the placeholder with the actual number, but now the pluralization can be translated separately, and as part of the whole phrase. Note that the last argument to _n is still the plugin text domain to be used.

## See also

- [wp i18n — (WP-CLI → Команды)](https://wp-kama.ru/handbook/wp-cli/wp/i18n)
	- `wp i18n` примеры
- [Localization – Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/internationalization/localization/)
	- Generate MO file.
- [How to Internationalize Your Plugin | Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/internationalization/how-to-internationalize-your-plugin/)
- [More Internationalization Fun » Otto on WordPress](https://ottopress.com/2012/more-internationalization-fun/)
- [Debug MO Translations – WordPress plugin | WordPress.org](https://wordpress.org/plugins/debug-mo-translations/)