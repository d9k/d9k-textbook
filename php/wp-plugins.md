# WordPress: #plugin development

## What is a Plugin? – Plugin Handbook | Developer.WordPress.org

https://developer.wordpress.org/plugins/intro/what-is-a-plugin/

Most WordPress plugins are composed of many files, but a plugin really only needs one main file with a specifically formatted DocBlock \[?\] in the header.

## Plugin Basics – Plugin Handbook | Developer.WordPress.org

https://developer.wordpress.org/plugins/plugin-basics/

At its simplest, a WordPress plugin is a PHP file with a WordPress plugin header comment.

Plugin header comment is a specially formatted PHP block comment that contains metadata about the plugin, such as its name, author, version, license, etc. The plugin header comment must comply with the header requirements, and at the very least, contain the name of the plugin.

Two types of hooks within WordPress: actions and filters. Actions allow you to add or change WordPress functionality, while filters allow you to alter content as it is loaded and displayed to the website user.

The 3 basic hooks you’ll need when creating a plugin are the `register_activation_hook()`, the `register_deactivation_hook()`, and the `register_uninstall_hook()`.

You can add your own, custom hooks with `do_action()`, which will enable developers to extend your plugin by passing functions through your hooks.

## Header Requirements – Plugin Handbook | Developer.WordPress.org

https://developer.wordpress.org/plugins/plugin-basics/header-requirements/

## register\_activation\_hook() – Function | Developer.WordPress.org

https://developer.wordpress.org/reference/functions/register_activation_hook/

When the plugin consists of only one file and is (as by default) located at `wp-content/plugins/sample.php` the name of this hook will be `activate_sample.php`.

Registering the hook inside the `plugins_loaded` hook will not work. You can’t call `register_activation_hook()` inside a function hooked to the `plugins_loaded` or `init` hooks (or any other hook). These hooks are called before the plugin is loaded or activated.

## Best Practices – Plugin Handbook | Developer.WordPress.org

https://developer.wordpress.org/plugins/plugin-basics/best-practices/

By default, all variables, functions and classes are defined in the global namespace, which means that it is possible for your plugin to override variables, functions and classes set by another plugin.

All globally accessible code should be prefixed with a unique identifier. Prefixes prevent conflicts with other plugins and prevents them from overwriting your variables and accidentally calling your functions and classes.

PHP provides a number of functions to verify existence of variables, functions, classes and constants. All of these will return true if the entity exists.

- **Variables**: [isset()](http://php.net/manual/en/function.isset.php) (includes arrays, objects, etc.)
- **Functions**: [function_exists()](http://php.net/manual/en/function.function-exists.php)
- **Classes**: [class_exists()](http://php.net/manual/en/function.class-exists.php)
- **Constants**: [defined()](http://php.net/manual/en/function.defined.php)

### Object Oriented Programming Method | Best Practices

https://developer.wordpress.org/plugins/plugin-basics/best-practices/#object-oriented-programming-method

An easier way to tackle the naming collision problem is to use a [class](http://php.net/manual/en/language.oop5.php) for the code of your plugin.

```php
if ( ! class_exists( 'WPOrg_Plugin' ) ) {
    class WPOrg_Plugin {
        public static function init() {
            register_setting( 'wporg_settings', 'wporg_option_foo' );
        }

        public static function get_foo() {
            return get_option( 'wporg_option_foo' );
        }
    }

    WPOrg_Plugin::init();
    WPOrg_Plugin::get_foo();
}
```

Init plugin example:

```php
add_action( 'init', array( 'MediaUploadLimit', 'init' ) );
```

### Folder Structure | Best Practices

https://developer.wordpress.org/plugins/plugin-basics/best-practices/#folder-structure

### Conditional Loading | Best Practices

https://developer.wordpress.org/plugins/plugin-basics/best-practices/#conditional-loading

```php
if ( is_admin() ) {
    // we are in admin mode
    require_once __DIR__ . '/admin/plugin-name-admin.php';
}
```

### Avoiding Direct File Access for security | Best Practices

https://developer.wordpress.org/plugins/plugin-basics/best-practices/#avoiding-direct-file-access

```php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
```

## Plugin example: Hello Dolly

https://plugins.trac.wordpress.org/browser/hello-dolly/trunk/hello.php

```
add_action( 'admin_notices', 'hello_dolly' );
add_action( 'admin_head', 'dolly_css' );
```

## See also

- [Advanced Topics | Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/hooks/advanced-topics/)