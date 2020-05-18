Administration menu
===================

disable default menu
--------------------
https://drupal.org/project/admin_menu
admin/modules 'Toolbar' module disable

Залогиниться в режиме обслуживания
----------------------------------
?q=user
/user/login

Отключить проверку обновлений
-----------------------------

Ошибки временных директорий
---------------------------

`fileowner... stat failed for temporary drupal....`

Создать папку с правами на запись в `sites/default/files/tmp` и проверить в админке по адресу 
	
	`http://[sitename]/users/[username]#overlay=admin/config/media/file-system`

(Конфигурация -> Мультимедия -> Файловая система), что временная папка указана правильно

Скрипт очистки кэша
-------------------

	<?php
	// define static var
	define('DRUPAL_ROOT', getcwd());
	// include bootstrap
	include_once('./includes/bootstrap.inc');
	// initialize stuff
	drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);
	// clear cache
	drupal_flush_all_caches();
	?>

https://www.drupal.org/documentation/clearing-rebuilding-cache