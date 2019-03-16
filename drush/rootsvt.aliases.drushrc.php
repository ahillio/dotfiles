<?php
// :%s/\(aliases\['\)/\1rootsvt./g

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site rootsvt, environment dev.
$aliases['rootsvt.dev'] = array(
  'root' => '/var/www/html/rootsvt.dev/docroot',
  'ac-site' => 'rootsvt',
  'ac-env' => 'dev',
  'ac-realm' => 'devcloud',
  'uri' => 'rootsvtm8gxnvk7yp.devcloud.acquia-sites.com',
  'remote-host' => 'rootsvtm8gxnvk7yp.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'rootsvt.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['rootsvt.dev.livedev'] = array(
  'parent' => '@rootsvt.dev',
  'root' => '/mnt/gfs/rootsvt.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site rootsvt, environment prod.
$aliases['rootsvt.prod'] = array(
  'root' => '/var/www/html/rootsvt.prod/docroot',
  'ac-site' => 'rootsvt',
  'ac-env' => 'prod',
  'ac-realm' => 'devcloud',
  'uri' => 'rootsvtdmytbpvevv.devcloud.acquia-sites.com',
  'remote-host' => 'rootsvtdmytbpvevv.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'rootsvt.prod',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['rootsvt.prod.livedev'] = array(
  'parent' => '@rootsvt.prod',
  'root' => '/mnt/gfs/rootsvt.prod/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site rootsvt, environment test.
$aliases['rootsvt.test'] = array(
  'root' => '/var/www/html/rootsvt.test/docroot',
  'ac-site' => 'rootsvt',
  'ac-env' => 'test',
  'ac-realm' => 'devcloud',
  'uri' => 'rootsvtnyetd9qgdj.devcloud.acquia-sites.com',
  'remote-host' => 'rootsvtnyetd9qgdj.ssh.devcloud.acquia-sites.com',
  'remote-user' => 'rootsvt.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  ),
);
$aliases['rootsvt.test.livedev'] = array(
  'parent' => '@rootsvt.test',
  'root' => '/mnt/gfs/rootsvt.test/livedev/docroot',
);
