core = "7.x"
api = 2

projects[drupal][type] = core
; Make system directories configurable to allow tests in profiles/[name]/modules to be run.
; http://drupal.org/node/911354
projects[drupal][patch][911354] = http://drupal.org/files/issues/911354-62-simpletest-profiles.patch

; Missing drupal_alter() for text formats and filters
; http://drupal.org/node/903730
projects[drupal][patch][903730] = http://drupal.org/files/issues/drupal.filter-alter.92.patch

; Use vocabulary machine name for permissions
; http://drupal.org/node/995156
projects[drupal][patch][995156] = http://drupal.org/files/issues/995156-5_portable_taxonomy_permissions.patch

; Fix object menu router conversion issue.
; http://drupal.org/node/972536
projects[drupal][patch][972536] = http://drupal.org/files/issues/drupal-menu-int-972536-78.patch

; Allow password flood to be reset
; http://drupal.org/node/992540
projects[drupal][patch][992540] = http://drupal.org/files/issues/992540-3-reset_flood_limit_on_password_reset-drush.patch

;;;;;;
; Fields
;;;;;;
projects[date][type] = "module"
projects[field_group][type] = "module"
projects[link][type] = "module"
projects[link][version] = "1.x-dev"
projects[options_element][type] = "module"
projects[references][type] = "module"

;;;;;;
; Path Tools
;;;;;;
projects[globalredirect][type] = "module"
projects[pathauto][type] = "module"
projects[redirect][type] = "module"
projects[transliteration][type] = "module"


;;;;;;
; Sitebuilding tools
;;;;;;
projects[apps][version] = "1.x-dev"
projects[apps][type] = "module"
projects[backup_migrate][type] = "module"
projects[boxes][type] = "module"
projects[ctools][type] = "module"
projects[defaultcontent][type] = "module"
projects[ds][type] = "module"
projects[email_registration][type] = "module"
projects[entity][type] = "module"
projects[entitycache][type] = "module"
projects[features][version] = "1.x-dev"
projects[features][type] = "module"
; Fix user_permissions so only for included roles.
; http://drupal.org/node/656312
projects[features][patch][656312] = http://drupal.org/files/issues/features_permission_export-656312-11--D7.patch
projects[libraries][type] = "module"
projects[menu_block][type] = "module"
projects[strongarm][type] = "module"
projects[skinr][type] = "module"
projects[token][type] = "module"
projects[views][type] = "module"

;;;;;;
; Text Editor
;;;;;;
projects[htmlpurifier][type] = "module"
projects[imce][type] = "module"
projects[imce_wysiwyg][type] = "module"
projects[wysiwyg][type] = "module"
; Fix path_to_theme()
; http://drupal.org/node/835682
projects[wysiwyg][patch][835682] = http://drupal.org/files/issues/wysiwyg-835682-12.patch
; Fix empty font styles drop down()
; http://drupal.org/node/746524
projects[wysiwyg][patch][746524] = http://drupal.org/files/issues/746524-91Drupal7-v3_drush_make.patch

;;;;;;
; UI Enhancements
;;;;;;
projects[backports][type] = "module"
projects[block_visibility][type] = "module"
projects[nodeblock][type] = "module"
projects[nodeconnect][type] = "module"
projects[simplified_menu_admin][type] = "module"
projects[simplified_modules][type] = "module"
projects[ux_elements][type] = "module"
; form_process_horizontal_tabs previously declared
; http://drupal.org/node/1224568
projects[ux_elements][patch][1224568] = http://drupal.org/files/issues/1224568-ux_elements_redeclare.patch

;;;;;
; Custom/Features
;;;;;

projects[enterprise_content][subdir] = "custom"
projects[enterprise_content][location] = http://apps.leveltendesign.com/fserver

;projects[tutorials][type] = "module"

;;;;;
; Libraries
;;;;;
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.1/ckeditor_3.6.1.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][destination] = "libraries"

libraries[htmlpurifier][download][type] = "get"
libraries[htmlpurifier][download][url] = "http://htmlpurifier.org/releases/htmlpurifier-4.3.0.zip"
libraries[htmlpurifier][directory_name] = "htmlpurifier"
libraries[htmlpurifier][destination] = "libraries"

;;;;;;
; Theme
;;;;;;

projects[tao][type] = theme
projects[rubik][type] = theme
projects[acquia_marina][type] = theme
projects[acquia_prosper][type] = theme
projects[adaptivetheme][type] = theme
projects[corolla][type] = theme
projects[fusion][type] = theme
projects[jackson][type] = theme
projects[oe_bartik][type] = theme
projects[oe_bartik][download][type] = "git"
projects[oe_bartik][download][url] = "http://git.drupal.org/sandbox/tombo/1287712.git"
