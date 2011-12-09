<?php

/**
* A trick to enforce page refresh when theme is changed from an overlay.
*/
function openenterprise_admin_paths_alter(&$paths) {
  $paths['admin/appearance/default*'] = FALSE;
}

/**
 * Implements hook_appstore_stores_info
 */
function openenterprise_apps_servers_info() {
  $profile = variable_get('install_profile', 'standard');
  $info =  drupal_parse_info_file(drupal_get_path('profile', $profile) . '/' . $profile . '.info');
  return array(
    'levelten' => array(
      'title' => 'LevelTen',
      'description' => "Apps from LevelTen Interactive",
      'manifest' => 'http://apps.leveltendesign.com/app/query',
      'profile' => $profile,
      'profile_version' => isset($info['version']) ? $info['version'] : '7.x-1.x',
      'server_name' => $_SERVER['SERVER_NAME'],
      'server_ip' => $_SERVER['SERVER_ADDR'],
    ),
  );
}

/**
 * implements hook_install_configure_form_alter()
 */
function openenterprise_form_install_configure_form_alter(&$form, &$form_state) {
  // Many modules set messages during installation that are very annoying.
  // (I'm looking at you Date and IMCE)
  // Lets remove these and readd the only message that should be set.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Warn about settings.php permissions risk
  $settings_dir = conf_path();
  $settings_file = $settings_dir . '/settings.php';
  // Check that $_POST is empty so we only show this message when the form is
  // first displayed, not on the next page after it is submitted. (We do not
  // want to repeat it multiple times because it is a general warning that is
  // not related to the rest of the installation process; it would also be
  // especially out of place on the last page of the installer, where it would
  // distract from the message that the Drupal installation has completed
  // successfully.)
  if (empty($_POST) && (!drupal_verify_install_file(DRUPAL_ROOT . '/' . $settings_file, FILE_EXIST|FILE_READABLE|FILE_NOT_WRITABLE) || !drupal_verify_install_file(DRUPAL_ROOT . '/' . $settings_dir, FILE_NOT_WRITABLE, 'dir'))) {
    drupal_set_message(st('All necessary changes to %dir and %file have been made, so you should remove write permissions to them now in order to avoid security risks. If you are unsure how to do so, consult the <a href="@handbook_url">online handbook</a>.', array('%dir' => $settings_dir, '%file' => $settings_file, '@handbook_url' => 'http://drupal.org/server-permissions')), 'warning');
  }

  $form['site_information']['site_name']['#default_value'] = 'OpenEnterprise';
  $form['site_information']['site_mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST'];
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST'];
}

/**
 * Set Open Enterprise as default install profile.
 *
 * Must use system as the hook module because openenterprise is not active yet
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  // Hide default drupal profiles
  unset($form['profile']['Minimal']);
  unset($form['profile']['Standard']);
  foreach($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'openenterprise';
  }
}

/**
 * Implements hook_install_tasks
 */
function openenterprise_install_tasks($install_state) {
  // Only use apps forms during interactive installs.
  if ($install_state['interactive']) {
    $tasks = array(
      'openenterprise_apps_select_form' => array(
        'display_name' => st('Install Apps'),
        'type' => 'form',
      ),
      'openenterprise_download_app_modules' => array(
        'display' => FALSE,
        'type' => 'batch',
        'run' => (isset($_SESSION['apps']))?INSTALL_TASK_RUN_IF_NOT_COMPLETED:INSTALL_TASK_SKIP,
      ),
      'openenterprise_install_app_modules' => array(
        'display' => FALSE,
        'type' => 'batch',
        'run' => (isset($_SESSION['apps']))?INSTALL_TASK_RUN_IF_NOT_COMPLETED:INSTALL_TASK_SKIP,
      ),
      'openenterprise_enable_app_modules' => array(
        'display' => FALSE,
        'run' => (isset($_SESSION['apps']))?INSTALL_TASK_RUN_IF_NOT_COMPLETED:INSTALL_TASK_SKIP,
      ),
    );
  }
  return $tasks;
}

/**
 * Change the final task to our task
 */
function openenterprise_install_tasks_alter(&$tasks, $install_state) {
  $tasks['install_finished']['function'] = "openenterprise_install_finished";
}

/**
 * Installation task; perform final steps and display a 'finished' page.
 *
 * @param $install_state
 *   An array of information about the current installation state.
 *
 * @return
 *   A message informing the user that the installation is complete.
 */
function openenterprise_install_finished(&$install_state) {
  drupal_set_title(st('@drupal installation complete', array('@drupal' => drupal_install_profile_distribution_name())), PASS_THROUGH);
  if (empty($_SESSION['apps'])) {
    $output = '<h2>' . st('Congratulations, you installed @drupal!', array('@drupal' => drupal_install_profile_distribution_name())) . '</h2>';
    $output .= '<p>' . st('By not installing any apps, your site is currently a blank. To get started you can either create your own content types, views and set up the site yourself or install some prebuild apps. Apps provide complete bundled functionality that will greatly speed up the process of creating your site.') . '</p>';
    $output .= '<p>' . st('Even after installing apps your site may look very empty before you add some content. To see what it looks like with content, try installing the default content for each of the apps. This can be done on each app\'s configuration page.') . '</p>';
    $output .= '<h2>' . st('Next Step') . '</h2>';
    $output .= '<p>' . st('<a href="@url">Install some apps</a>', array('@url' => url('admin/apps'))) . ' or ' . st('<a href="@url">go to your site\'s home page</a>.', array('@url' => url('<front>'))) . '</p>';
  }
  else {
    $link = (isset($_SESSION['apps_default_content']))?drupal_get_normal_path('home'):'<front>';
    $output = '<h2>' . st('Congratulations, you installed @drupal!', array('@drupal' => drupal_install_profile_distribution_name())) . '</h2>';
    $output .= '<p>' . st('Your site now contains the apps you selected. To add more, go to the Apps menu in the admin menu at the top of the site.') . '</p>';
    $output .= '<h2>' . st('Next Step') . '</h2>';
    $output .= '<p>' . st('<a href="@url">Go to your site\'s home page</a>.', array('@url' => url($link))) . '</p>';
  }

  // Flush all caches to ensure that any full bootstraps during the installer
  // do not leave stale cached data, and that any content types or other items
  // registered by the install profile are registered correctly.
  drupal_flush_all_caches();

  // Remember the profile which was used.
  variable_set('install_profile', drupal_get_profile());

  // Install profiles are always loaded last
  db_update('system')
    ->fields(array('weight' => 1000))
    ->condition('type', 'module')
    ->condition('name', drupal_get_profile())
    ->execute();

  // Cache a fully-built schema.
  drupal_get_schema(NULL, TRUE);

  // Run cron to populate update status tables (if available) so that users
  // will be warned if they've installed an out of date Drupal version.
  // Will also trigger indexing of profile-supplied content or feeds.
  drupal_cron_run();

  return $output;
}

/**
 * We only want to get the apps_manifest once so cache it.
 */
function openenterprise_get_apps_manifest() {
  static $apps_manifest;
  
  if (!isset($apps_manifest)) {
    // Not sure this is doing anything because we are using DrupalFakeCache at this point.
    $cache = cache_get('apps_manifest');
    if ($cache && isset($cache->data)) {
      $apps_manifest = $cache->data;
    }
    else {
      $apps_manifest = apps_apps('levelten', array(), TRUE);
      cache_set('apps_manifest', $apps_manifest);
    }
  }

  return $apps_manifest;
}

/**
 * Apps install form
 */
function openenterprise_apps_select_form($form, $form_state, &$install_state) {
  drupal_set_title(t('Install Apps'));
  apps_include('manifest');

  // Set a message if not writeable.
  $writeable = is_writable('sites') && is_writable('sites/all') && is_writable('sites/all/modules') && is_writable(conf_path());
  if (!$form_state['rebuild'] && !$writeable) {
    drupal_set_message('<b>Sites directory is not writeable.</b><br> You will not be able to install apps unless the sites directory is writeable. <br><br>To change this go to your sites root directory and type \'chmod 777 -R sites\'', 'error');
  }

  $form['actions'] = array('#type' => 'actions', '#weight' => 3);
  if ($writeable) {
    if (!isset($install_state['apps_manifest'])) {
      $install_state['apps_manifest'] = openenterprise_get_apps_manifest();
    }
    foreach($install_state['apps_manifest'] as $name => $app) {
      if ($name != '#theme') {
        $options[$name] = '<strong>' . $app['name'] . '</strong><br>' . $app['description'];
      }
    }
    $form = array();

    $form['apps_message'] = array(
      '#markup' => t('<h2>Apps</h2><p>Apps are the next generation in usability for Drupal. They contain bundles of functionality for your website. Select any apps you want to install right now. You can add more later on the apps page.</p></p>In order to install apps, the "sites" directory of your website must be writable.</p>'),
    );

    $form['apps_fieldset'] = array(
      '#type' => 'fieldset',
      '#title' => t('Select Apps To Install'),
      '#collapsible' => FALSE,
    );
    $form['apps_fieldset']['apps'] = array(
      '#type' =>'checkboxes',
      '#title' => t('Apps'),
      '#default_value' => array('enterprise_blog', 'enterprise_rotator'), //This should be set somehow.
      '#options' => $options,
    );

    $form['default_content_fieldset'] = array(
      '#type' => 'fieldset',
      '#title' => t('Default Content'),
      '#collapsible' => FALSE,
    );
    $form['default_content_fieldset']['default_content'] = array(
      '#type' => 'checkbox',
      '#title' => t('Install default content'),
      '#default_value' => TRUE,
      '#description' => t('By selecting this box default content will be installed for each app. Without default content the site may look empty before you start adding to it. You can remove the default content later by going to the apps config page.'),
    );
  }

  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => t('Install Apps'),
    '#disabled' => !$writeable,
  );
  $form['actions']['skip'] = array(
    '#type' => 'submit',
    '#value' => t('Skip this step'),
  );
  $form['actions']['reload'] = array(
    '#type' => 'submit',
    '#value' => t("Recheck 'sites' permissions"),
    '#executes_submit_callback' => FALSE,
  );
  drupal_add_css("#openenterprise-apps-select-form .form-submit { display:inline; }", array('type' => 'inline'));
  // We need to hide this with css. If we disable or remove the button it will interfere with the rebuilding the form process when it is clicked.
  if ($writeable) {
    drupal_add_css("#openenterprise-apps-select-form #edit-reload { display:none; }", array('type' => 'inline'));
  }

  return $form;
}

/**
 * Submit function for openenterprise_apps_select_form.
 */
function openenterprise_apps_select_form_submit($form, &$form_state) {
  if ($form_state['values']['op'] == t('Install Apps')) {
    global $install_state;
    $install_state['apps'] = array_filter($form_state['values']['apps']);
    $install_state['apps_default_content'] = $form_state['values']['default_content'];
    // For some reason the install_state gets lost in the last steps. Adding to session as well.
    $_SESSION['apps'] = array_filter($form_state['values']['apps']);
    $_SESSION['apps_default_content'] = $form_state['values']['default_content'];
  }
}

/**
 * Batch process apps download.
 */
function openenterprise_download_app_modules(&$install_state) {
  // Copied and modified from apps.installer.inc
  $download_commands = array();
  foreach ($install_state['apps'] as $id => $name) {
    $downloads = array();
    $app = $install_state['apps_manifest'][$name];
    // find all downloads needed for dependencies
    foreach($app['dependencies'] as $dep) {
      if(!$dep['installed']) {
        $downloads[$dep['downloadable']]['for'][] = $dep['version']['name'];
      }
    }
    // add our core modules download
    if(!$app['installed']) {
      $downloads[$app['downloadable']]['for'][] = $app['machine_name'];
    }
    //foreach download find the url
    foreach($downloads as $key => $download) {
      $downloads[$key]['url'] = $app['downloadables'][$key];
      // do a quick dirty pull of the name from the key
      $downloads[$key]['name'] = ($e = strpos($key, " ")) ? substr($key, 0, $e) : $key;
    }
    foreach($downloads as $download) {
      $download_commands[] = array(
        'apps_download_batch',
        array(
          $download['name'],
          $download['url']
        ),
      );
    }
  }
  $batch = array(
    'operations' => $download_commands,
    'file' => drupal_get_path('module', 'apps') . '/apps.installer.inc',
    'title' => t('Downloading modules'),
    'finished' => 'openenterprise_download_batch_finished',
    'init_message' => t('Preparing to download needed modules'),
  );
  return $batch;
}

/**
 * Batch callback invoked when the download batch is completed.
 *
 * A pass though to update_manager_download_batch_finished
 */
function openenterprise_download_batch_finished($success, $results) {
  if (isset($results['projects'])) {
    $_SESSION['update_manager_update_projects'] = $results['projects'];
  }
}

/**
 * Batch process apps install.
 */
function openenterprise_install_app_modules(&$install_state) {
  $batch = array();
  if (!empty($_SESSION['update_manager_update_projects'])) {
    apps_include('installer');
    // Make sure the Updater registry is loaded.
    drupal_get_updaters();

    $updates = array();
    $directory = _update_manager_extract_directory();

    $projects = $_SESSION['update_manager_update_projects'];
    foreach ($projects as $project => $url) {
      $project_location = $directory . '/' . $project;
      $updater = Updater::factory($project_location);
      $project_real_location = drupal_realpath($project_location);
      $updates[] = array(
        'project' => $project,
        'updater_name' => get_class($updater),
        'local_url' => $project_real_location,
      );
    }

    // If the owner of the last directory we extracted is the same as the
    // owner of our configuration directory (e.g. sites/default) where we're
    // trying to install the code, there's no need to prompt for FTP/SSH
    // credentials. Instead, we instantiate a FileTransferLocal and invoke
    // update_authorize_run_update() directly.
    //if (fileowner($project_real_location) == fileowner(conf_path())) {
    if (is_writeable(conf_path())) {
      module_load_include('inc', 'update', 'update.authorize');
      $filetransfer = new FileTransferLocal(DRUPAL_ROOT);
      $operations = array();
      foreach ($updates as $update => $update_info) {
        $operations[] = array(
          'update_authorize_batch_copy_project',
          array(
            $update_info['project'],
            $update_info['updater_name'],
            $update_info['local_url'],
            $filetransfer,
          ),
        );
      }

      $batch = array(
        'title' => t('Installing updates'),
        'init_message' => t('Preparing to update your site'),
        'operations' => $operations,
        'file' => drupal_get_path('module', 'update') . '/update.authorize.inc',
      );
      unset($_SESSION['update_manager_update_projects']);
    }
  }
  return $batch;
}

/**
 * Install downloaded apps.
 */
function openenterprise_enable_app_modules(&$install_state) {
  $modules = array_keys($_SESSION['apps']);
  if ($_SESSION['apps_default_content']) {
    $modules[] = 'enterprise_content';
    $files = system_rebuild_module_data();
    foreach($_SESSION['apps'] as $app) {
      // Should probably check the app to see the proper way to do this.
      if (isset($files[$app . '_content'])) {
        $modules[] = $app . '_content';
      }
    }
  }
  if (!empty($modules)) {
    module_enable($modules);
  }
}

/**
 * Implements hook_block_info()
 */
function openenterprise_block_info() {
  $blocks['powered-by'] = array(
    'info' => t('Powered by OpenEnterprise'),
    'weight' => '10',
    'cache' => DRUPAL_NO_CACHE,
  );
  return $blocks;
}

/**
 * Implements hook_block_view().
 */
function openenterprise_block_view($delta = '') {
  $block = array();
  switch ($delta) {
    case 'powered-by':
      $block['subject'] = NULL;
      $block['content'] = '<span>' . t('Powered by <a href="http://apps.leveltendesign.com/project/openenterprise" target="_blank">OpenEnterprise</a>. A distribution by <a href="http://www.leveltendesign.com" target="_blank">LevelTen Interactive</a>') . '</span>';
      return $block;
  }
}
