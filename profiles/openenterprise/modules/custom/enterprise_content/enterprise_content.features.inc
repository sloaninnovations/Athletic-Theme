<?php
/**
 * @file
 * enterprise_content.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function enterprise_content_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "boxes" && $api == "box") {
    return array("version" => "1");
  }
}
