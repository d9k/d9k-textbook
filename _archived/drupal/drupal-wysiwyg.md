
CK editor strips `<script>` tag
-------------------------------

You can resolve this by going to the "Advanced Options" section of your CKEditor profile and adding the following string into the text area: config.allowedContent = true;

For me, the problem was with the Teaser Break plugin that's bundled with the Wysiwyg module. Disabling that button for my Wysiwyg profile solved the problem for me.

http://drupal.stackexchange.com/questions/40235/how-to-stop-ckeditor-3-6-3-7474-from-stripping-script-tags