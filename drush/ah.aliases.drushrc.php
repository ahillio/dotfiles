<?php
// note: 23feb2018 added "ah." to all $aliases[]
// :%s/\(aliases\['\)/\1ah./g

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site ah, environment dev.
$aliases['ah.dev'] = array(
  'root' => '/var/www/html/ah.dev/docroot',
  'ac-site' => 'ah',
  'ac-env' => 'dev',
  'ac-realm' => 'devcloud',
  'uri' => 'ahb4fqdmyxfc.devcloud.acquia-sites.com',
  'remote-host' => 'srv-4847.devcloud.hosting.acquia.com',
  'remote-user' => 'ah.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['ah.dev.livedev'] = array(
  'parent' => '@ah.dev',
  'root' => '/mnt/gfs/ah.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site ah, environment prod.
$aliases['ah.prod'] = array(
  'root' => '/var/www/html/ah.prod/docroot',
  'ac-site' => 'ah',
  'ac-env' => 'prod',
  'ac-realm' => 'devcloud',
  'uri' => 'ahm94avwj668.devcloud.acquia-sites.com',
  'remote-host' => 'ahm94avwj668.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'ah.prod',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['ah.prod.livedev'] = array(
  'parent' => '@ah.prod',
  'root' => '/mnt/gfs/ah.prod/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site ah, environment test.
$aliases['ah.test'] = array(
  'root' => '/var/www/html/ah.test/docroot',
  'ac-site' => 'ah',
  'ac-env' => 'test',
  'ac-realm' => 'devcloud',
  'uri' => 'ahdznehzhfjx.devcloud.acquia-sites.com',
  'remote-host' => 'ahdznehzhfjx.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'ah.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['ah.test.livedev'] = array(
  'parent' => '@ah.test',
  'root' => '/mnt/gfs/ah.test/livedev/docroot',
);
