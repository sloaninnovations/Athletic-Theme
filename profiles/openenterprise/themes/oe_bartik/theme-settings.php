<?php
function oe_bartik_form_system_theme_settings_alter(&$form, &$form_state) {
  $form['responsive'] = array(
    '#type' => 'fieldset',
    '#title' => t('Respond.js'),
    '#description' => 'Use respond.js to parse media queries to make versions of IE less than 9 responsive.',
    '#weight' => 0,
  );
  $form['responsive']['enabled'] = array(
    '#type' => 'checkbox',
    '#title' => t('Enable respond.js'),
    '#default_value' => theme_get_setting('enabled'),
    '#description' => 'Place the respond.js script into the js/ folder of theme and enable it with the checkbox.',
  );
}

