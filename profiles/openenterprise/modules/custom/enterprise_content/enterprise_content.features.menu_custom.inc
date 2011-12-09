<?php
/**
 * @file
 * enterprise_content.features.menu_custom.inc
 */

/**
 * Implements hook_menu_default_menu_custom().
 */
function enterprise_content_menu_default_menu_custom() {
  $menus = array();

  // Exported menu: menu-legal-notices
  $menus['menu-legal-notices'] = array(
    'menu_name' => 'menu-legal-notices',
    'title' => 'Legal Notices',
    'description' => 'Legal Notices contain a list of links to About, Terms of Use and Privacy Policy.',
  );
  // Exported menu: menu-social
  $menus['menu-social'] = array(
    'menu_name' => 'menu-social',
    'title' => 'Social',
    'description' => 'A menu for social links.',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('A menu for social links.');
  t('Legal Notices');
  t('Legal Notices contain a list of links to About, Terms of Use and Privacy Policy.');
  t('Social');


  return $menus;
}
