theme('image_style')
Posted by bloke_zero on January 17, 2011 at 3:18pm
there is a theme('image_style') which is roughly analogous to theme('imagecache')

Looks something like:

	<?php
	$hero_image = array(
	  'style_name' => 'case_study_teaser',
	  'path' => $image['uri'],
	  'width' => '',
	  'height' => '',
	  'alt' => $image['alt'],
	  'title' => $image['title'],
	  );
	print theme('image_style',$hero_image);
	?>

https://drupal.org/node/958726


print image_style_url($style, $img_url)

- - - - - - - - - - - - - - - - - - - - - - - - - 
