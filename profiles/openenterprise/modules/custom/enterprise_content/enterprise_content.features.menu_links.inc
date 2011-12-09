<?php
/**
 * @file
 * enterprise_content.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function enterprise_content_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: menu-social:http://linkedin.com
  $menu_links['menu-social:http://www.linkedin.com'] = array(
    'menu_name' => 'menu-social',
    'link_path' => 'http://www.linkedin.com',
    'router_path' => '',
    'link_title' => 'LinkedIn',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
    ),
    'module' => 'menu',
    'hidden' => '0',
    'external' => '1',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '0',
  );
  // Exported menu link: menu-social:http://twitter.com
  $menu_links['menu-social:http://twitter.com'] = array(
    'menu_name' => 'menu-social',
    'link_path' => 'http://twitter.com',
    'router_path' => '',
    'link_title' => 'Twitter',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
    ),
    'module' => 'menu',
    'hidden' => '0',
    'external' => '1',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '0',
  );
  // Exported menu link: menu-social:http://www.facebook.com
  $menu_links['menu-social:http://www.facebook.com'] = array(
    'menu_name' => 'menu-social',
    'link_path' => 'http://www.facebook.com',
    'router_path' => '',
    'link_title' => 'Facebook',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
    ),
    'module' => 'menu',
    'hidden' => '0',
    'external' => '1',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '0',
  );
  // Exported menu link: menu-social:http://youtube.com
  $menu_links['menu-social:http://www.youtube.com'] = array(
    'menu_name' => 'menu-social',
    'link_path' => 'http://www.youtube.com',
    'router_path' => '',
    'link_title' => 'YouTube',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
    ),
    'module' => 'menu',
    'hidden' => '0',
    'external' => '1',
    'has_children' => '0',
    'expanded' => '0',
    'weight' => '0',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('About Us');
  t('Facebook');
  t('LinkedIn');
  t('Privacy Policy');
  t('Terms and Conditions');
  t('Twitter');
  t('YouTube');


  return $menu_links;
}
