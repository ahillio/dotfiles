<?php
// On 23feb2018 add lgk to all $aliases[]
// :%s/\(aliases\['\)/\1ah./g

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site lgk, environment dev.
$aliases['lgk.dev'] = array(
  'root' => '/var/www/html/lgk.dev/docroot',
  'ac-site' => 'lgk',
  'ac-env' => 'dev',
  'ac-realm' => 'devcloud',
  'uri' => 'lgkr8kfpov8ve.devcloud.acquia-sites.com',
  'remote-host' => 'lgkr8kfpov8ve.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'lgk.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['lgk.dev.livedev'] = array(
  'parent' => '@lgk.dev',
  'root' => '/mnt/gfs/lgk.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site lgk, environment prod.
$aliases['lgk.prod'] = array(
  'root' => '/var/www/html/lgk.prod/docroot',
  'ac-site' => 'lgk',
  'ac-env' => 'prod',
  'ac-realm' => 'devcloud',
  'uri' => 'lgkne2choujda.devcloud.acquia-sites.com',
  'remote-host' => 'lgkne2choujda.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'lgk.prod',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['lgk.prod.livedev'] = array(
  'parent' => '@lgk.prod',
  'root' => '/mnt/gfs/lgk.prod/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site lgk, environment test.
$aliases['lgk.test'] = array(
  'root' => '/var/www/html/lgk.test/docroot',
  'ac-site' => 'lgk',
  'ac-env' => 'test',
  'ac-realm' => 'devcloud',
  'uri' => 'lgkcg5cvdt5v4.devcloud.acquia-sites.com',
  'remote-host' => 'lgkcg5cvdt5v4.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'lgk.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['lgk.test.livedev'] = array(
  'parent' => '@lgk.test',
  'root' => '/mnt/gfs/lgk.test/livedev/docroot',
);
