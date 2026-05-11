# WordPress: plugins: options

- [Settings – Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/settings/)
- [Options API – Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/settings/options-api/)
- [Custom Settings Page | Plugin Handbook | Developer.WordPress.org](https://developer.wordpress.org/plugins/settings/custom-settings-page/)

## Validate option value

 - :speech_balloon: [wordpress - save and retrieve custom plugin options input | SO](https://stackoverflow.com/questions/15550580/save-and-retrieve-custom-plugin-options-input)

```php
register_setting( 'MyPlugin_options_group', 'custom_MyPlugin_option1', 'custom_MyPlugin_option1_validate' );

function custom_MyPlugin_option1_validate($input) {
	return intval($input);
}

// . . . . . in template
settings_fields('UploadMaxImageSize_options_group');
?>
    <input type="number" id="custom_MyPlugin_option1"
        name="custom_MyPlugin_option1"
        value="<?php echo get_option('custom_MyPlugin_option1'); ?>" />
```

- :beginner: [register\_setting() | Function | Developer.WordPress.org](https://developer.wordpress.org/reference/functions/register_setting/)