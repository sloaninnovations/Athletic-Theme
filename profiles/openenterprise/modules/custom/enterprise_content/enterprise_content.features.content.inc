<?php
/**
 * @file
 * enterprise_content.features.content.inc
 */

/**
 * Implements hook_content_defaults().
 */
function enterprise_content_content_defaults() {
$content = array();
$content['about_us'] = (object)array(
  'exported_path' => 'about-us',
  'title' => 'About Us',
  'status' => '1',
  'promote' => '0',
  'sticky' => '0',
  'type' => 'page',
  'language' => 'und',
  'created' => '1318779935',
  'comment' => '1',
  'translate' => '0',
  'machine_name' => 'about_us',
  'body' => array(
    'und' => array(
      0 => array(
        'value' => '<p>&nbsp;</p><p style="margin-bottom: 20px; border-style: initial; border-color: initial; font-size: 13px; ">LevelTen design was founded in June of 1999 to provide creative design to Lorentz Consulting Group, LLC. What started as a one man division has blossomed into a full service interactive agency. Today&#39;s LevelTen boasts a unique, close-knit team with experts in all facets of interactive development; strategic, creative and technical.</p><p style="margin-bottom: 20px; border-style: initial; border-color: initial; font-size: 13px; ">LevelTen created Open Enterprise to help other organizations build more successful websites. Open Enterprise is both a platform for building results oriented websites and a set of strategies for maximizing online success.</p><p style="margin-bottom: 20px; border-style: initial; border-color: initial; font-size: 13px; ">The goal of Open Enterprise is to provide organizations with both a great technology for building interactive websites, but also guidance in the best practices that drive online success. The technology enables the strategies and the strategies drive the technology.</p>',
        'summary' => '',
        'format' => 'filtered_html',
        'safe_value' => '<p> </p>
<p>LevelTen design was founded in June of 1999 to provide creative design to Lorentz Consulting Group, LLC. What started as a one man division has blossomed into a full service interactive agency. Today\'s LevelTen boasts a unique, close-knit team with experts in all facets of interactive development; strategic, creative and technical.</p>
<p>LevelTen created Open Enterprise to help other organizations build more successful websites. Open Enterprise is both a platform for building results oriented websites and a set of strategies for maximizing online success.</p>
<p>The goal of Open Enterprise is to provide organizations with both a great technology for building interactive websites, but also guidance in the best practices that drive online success. The technology enables the strategies and the strategies drive the technology.</p>
',
        'safe_summary' => '',
      ),
    ),
  ),
);
$content['home'] = (object)array(
  'exported_path' => 'home',
  'title' => 'Welcome to OpenEnterprise',
  'status' => '1',
  'promote' => '0',
  'sticky' => '0',
  'type' => 'page',
  'language' => 'und',
  'created' => '1318627403',
  'comment' => '1',
  'translate' => '0',
  'machine_name' => 'home',
  'body' => array(
    'und' => array(
      0 => array(
        'value' => '<p>Thanks for installing OpenEnteprise. We hope it helps you create an amazing website.</p><p><strong>Themes</strong></p><p>OpenEnterprise comes with several of the most popular themes available on Drupal.org. You can change the theme by going to Appearence at the top of the page. Please note that different themes have different regions and you may have to go to the blocks page and reposition the blocks into new regions when switching themes. Go to Structure-&gt;Blocks to change this.</p><p><strong>Apps</strong></p><p>Your site is currently a blank canvas with many great tools to build it. To get started you can either create your own content types, views and set up the site yourself or install some prebuild apps. Apps provide complete bundled functionality that will greatly speed up the process of creating your site.</p><p>To install more apps select the Apps menu item on the toolbar at the top of the page.</p><p><strong>Tutr.tv</strong></p><p>If you need more help with how to set up and administer your site, check out <a href="http://tutr.tv" target="_blank">tutr.tv</a>. It is a great place to find videos from many of the leading experts on Drupal. You can also get those videos embedded into your site with the <a href="http://drupal.org/project/tutorials" target="_blank">tutorials</a> module.</p><p>&nbsp;</p>',
        'summary' => '',
        'format' => 'filtered_html',
        'safe_value' => '<p>Thanks for installing OpenEnteprise. We hope it helps you create an amazing website.</p>
<p><strong>Themes</strong></p>
<p>OpenEnterprise comes with several of the most popular themes available on Drupal.org. You can change the theme by going to Appearence at the top of the page. Please note that different themes have different regions and you may have to go to the blocks page and reposition the blocks into new regions when switching themes. Go to Structure-&gt;Blocks to change this.</p>
<p><strong>Apps</strong></p>
<p>Your site is currently a blank canvas with many great tools to build it. To get started you can either create your own content types, views and set up the site yourself or install some prebuild apps. Apps provide complete bundled functionality that will greatly speed up the process of creating your site.</p>
<p>To install more apps select the Apps menu item on the toolbar at the top of the page.</p>
<p><strong>Tutr.tv</strong></p>
<p>If you need more help with how to set up and administer your site, check out <a href="http://tutr.tv" target="_blank">tutr.tv</a>. It is a great place to find videos from many of the leading experts on Drupal. You can also get those videos embedded into your site with the <a href="http://drupal.org/project/tutorials" target="_blank">tutorials</a> module.</p>
<p> </p>
',
        'safe_summary' => '',
      ),
    ),
  ),
);
$content['privacy_policy'] = (object)array(
  'exported_path' => 'privacy-policy',
  'title' => 'Privacy Policy',
  'status' => '1',
  'promote' => '0',
  'sticky' => '0',
  'type' => 'page',
  'language' => 'und',
  'created' => '1318780530',
  'comment' => '1',
  'translate' => '0',
  'machine_name' => 'privacy_policy',
  'body' => array(
    'und' => array(
      0 => array(
        'value' => '<p class="ih1"><b>Generic Privacy Policy</b></p><p>(last updated March 2011)</p><p class="hp">Websites linking to this page have chosen to adopt this generic privacy policy as their own. This means that they agree to abide by the principles laid out below.</p><h2>Information that is gathered from visitors</h2><p>In common with other websites, log files are stored on the web server saving details such as the visitor&#39;s IP address, browser type, referring page and time of visit.</p><p>Cookies may be used to remember visitor preferences when interacting with the website.</p><p>Where registration is required, the visitor&#39;s email and a username will be stored on the server.</p><h2>How the Information is used</h2><p>The information is used to enhance the vistor&#39;s experience when using the website to display personalised content and possibly advertising.</p><p>E-mail addresses will not be sold, rented or leased to 3rd parties.</p><p>E-mail may be sent to inform you of news of our services or offers by us or our affiliates.</p><h2>Visitor Options</h2><p>If you have subscribed to one of our services, you may unsubscribe by following the instructions which are included in e-mail that you receive.</p><p>You may be able to block cookies via your browser settings but this may prevent you from access to certain features of the website.</p><h2>Cookies</h2><p>Cookies are small digital signature files that are stored by your web browser that allow your preferences to be recorded when visiting the website. Also they may be used to track your return visits to the website.</p><p>3rd party advertising companies may also use cookies for tracking purposes.</p><h2>Google Ads</h2><p>Google, as a third party vendor, uses cookies to serve ads.</p><p>Google&#39;s use of the DART cookie enables it to serve ads to visitors based on their visit to sites they visit on the Internet.</p><p>Website visitors may opt out of the use of the DART cookie by visiting the Google ad and content network privacy policy.</p>',
        'summary' => '',
        'format' => 'filtered_html',
        'safe_value' => '<p class="ih1">Generic Privacy Policy</p>
<p>(last updated March 2011)</p>
<p class="hp">Websites linking to this page have chosen to adopt this generic privacy policy as their own. This means that they agree to abide by the principles laid out below.</p>
<h2>Information that is gathered from visitors</h2>
<p>In common with other websites, log files are stored on the web server saving details such as the visitor\'s IP address, browser type, referring page and time of visit.</p>
<p>Cookies may be used to remember visitor preferences when interacting with the website.</p>
<p>Where registration is required, the visitor\'s email and a username will be stored on the server.</p>
<h2>How the Information is used</h2>
<p>The information is used to enhance the vistor\'s experience when using the website to display personalised content and possibly advertising.</p>
<p>E-mail addresses will not be sold, rented or leased to 3rd parties.</p>
<p>E-mail may be sent to inform you of news of our services or offers by us or our affiliates.</p>
<h2>Visitor Options</h2>
<p>If you have subscribed to one of our services, you may unsubscribe by following the instructions which are included in e-mail that you receive.</p>
<p>You may be able to block cookies via your browser settings but this may prevent you from access to certain features of the website.</p>
<h2>Cookies</h2>
<p>Cookies are small digital signature files that are stored by your web browser that allow your preferences to be recorded when visiting the website. Also they may be used to track your return visits to the website.</p>
<p>3rd party advertising companies may also use cookies for tracking purposes.</p>
<h2>Google Ads</h2>
<p>Google, as a third party vendor, uses cookies to serve ads.</p>
<p>Google\'s use of the DART cookie enables it to serve ads to visitors based on their visit to sites they visit on the Internet.</p>
<p>Website visitors may opt out of the use of the DART cookie by visiting the Google ad and content network privacy policy.</p>
',
        'safe_summary' => '',
      ),
    ),
  ),
);
$content['terms_and_conditions'] = (object)array(
  'exported_path' => 'terms-and-conditions',
  'title' => 'Terms and Conditions',
  'status' => '1',
  'promote' => '0',
  'sticky' => '0',
  'type' => 'page',
  'language' => 'und',
  'created' => '1318781007',
  'comment' => '1',
  'translate' => '0',
  'machine_name' => 'terms_and_conditions',
  'body' => array(
    'und' => array(
      0 => array(
        'value' => '<p>Welcome to our website. If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern [business name]&#39;s relationship with you in relation to this website. If you disagree with any part of these terms and conditions, please do not use our website.</p><p style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: rgb(51, 51, 51); font-size: 1em; margin-bottom: 15px; line-height: 1.27em; ">The term &#39;[business name]&#39; or &#39;us&#39; or &#39;we&#39; refers to the owner of the website whose registered office is [address]. Our company registration number is [company registration number and place of registration]. The term &#39;you&#39; refers to the user or viewer of our website.</p><p style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: rgb(51, 51, 51); font-size: 1em; margin-bottom: 15px; line-height: 1.27em; ">The use of this website is subject to the following terms of use:</p><ul style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: rgb(51, 51, 51); font-size: 1em; margin-bottom: 10px; line-height: 1.3em; "><li style="margin-left: 25px; ">The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li><li style="margin-left: 25px; ">This website uses cookies to monitor browsing preferences. If you do allow cookies to be used, the following personal information may be stored by us for use by third parties: [insert list of information].</li><li style="margin-left: 25px; ">Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li><li style="margin-left: 25px; ">Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li><li style="margin-left: 25px; ">This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li><li style="margin-left: 25px; ">All trade marks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li><li style="margin-left: 25px; ">Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.</li><li style="margin-left: 25px; ">From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</li></ul>',
        'summary' => '',
        'format' => 'filtered_html',
        'safe_value' => '<p>Welcome to our website. If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern [business name]\'s relationship with you in relation to this website. If you disagree with any part of these terms and conditions, please do not use our website.</p>
<p>The term \'[business name]\' or \'us\' or \'we\' refers to the owner of the website whose registered office is [address]. Our company registration number is [company registration number and place of registration]. The term \'you\' refers to the user or viewer of our website.</p>
<p>The use of this website is subject to the following terms of use:</p>
<ul><li>The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>
<li>This website uses cookies to monitor browsing preferences. If you do allow cookies to be used, the following personal information may be stored by us for use by third parties: [insert list of information].</li>
<li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>
<li>Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li>
<li>This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>
<li>All trade marks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>
<li>Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.</li>
<li>From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</li>
</ul>',
        'safe_summary' => '',
      ),
    ),
  ),
);
return $content;
}
