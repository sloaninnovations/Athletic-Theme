<?php
/**
 * @file
 * enterprise_content.box.inc
 */

/**
 * Implements hook_default_box().
 */
function enterprise_content_default_box() {
  $export = array();

  $box = new stdClass;
  $box->disabled = FALSE; /* Edit this to true to make a default box disabled initially */
  $box->api_version = 1;
  $box->delta = 'oe1';
  $box->plugin_key = 'simple';
  $box->title = 'Demo Block 1';
  $box->description = 'Demo Block 1';
  $box->options = array(
    'body' => array(
      'value' => '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in metus ipsum, ut iaculis purus. Praesent fermentum mauris in augue rhoncus accumsan. Vivamus tellus odio, tincidunt nec commodo eget, fermentum ut sem. Phasellus rutrum iaculis lorem ac placerat. Proin accumsan feugiat vestibulum. Aenean accumsan scelerisque tellus, eu mollis neque commodo quis. Morbi euismod metus et quam aliquet blandit.</p>',
      'format' => 'filtered_html',
    ),
  );
  $export['oe1'] = $box;

  $box = new stdClass;
  $box->disabled = FALSE; /* Edit this to true to make a default box disabled initially */
  $box->api_version = 1;
  $box->delta = 'oe2';
  $box->plugin_key = 'simple';
  $box->title = 'Demo Block 2';
  $box->description = 'Demo Block 2';
  $box->options = array(
    'body' => array(
      'value' => '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget leo felis, in laoreet nulla. Proin sed purus eu nisi lobortis laoreet. Sed eros eros, fringilla id dignissim id, cursus nec nulla. Praesent id metus metus, ut porta enim. Sed consectetur ipsum in diam sagittis eu elementum orci sagittis. Donec id nisl metus, mollis venenatis libero.&nbsp;</p>',
      'format' => 'filtered_html',
    ),
  );
  $export['oe2'] = $box;

  $box = new stdClass;
  $box->disabled = FALSE; /* Edit this to true to make a default box disabled initially */
  $box->api_version = 1;
  $box->delta = 'oe3';
  $box->plugin_key = 'simple';
  $box->title = 'Demo Block 3';
  $box->description = 'Demo Block 3';
  $box->options = array(
    'body' => array(
      'value' => '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dapibus magna ac purus egestas tincidunt. Sed ut egestas lacus. Donec lorem eros, bibendum nec iaculis sed, ullamcorper et tellus. In hac habitasse platea dictumst. Donec quis pharetra arcu. Duis feugiat vulputate elementum. Nulla facilisi. Sed malesuada egestas neque quis gravida. Duis vitae magna fringilla neque convallis pellentesque.</p>',
      'format' => 'filtered_html',
    ),
  );
  $export['oe3'] = $box;

  return $export;
}
