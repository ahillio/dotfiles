<?php
  /**
   * Pantheon drush alias file, to be placed in your ~/.drush directory or the aliases
   * directory of your local Drush home. Once it's in place, clear drush cache:
   *
   * drush cc drush
   *
   * To see all your available aliases:
   *
   * drush sa
   *
   * See http://helpdesk.getpantheon.com/customer/portal/articles/411388 for details.
   */

  $aliases['letsgrowkids.live'] = array(
    'uri' => 'live-letsgrowkids.pantheonsite.io',
    'db-url' => 'mysql://pantheon:b67ab2845e964dfabaf8a39b35138945@dbserver.live.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in:13601/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.live.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in',
    'remote-user' => 'live.df95dea1-6ca7-4412-88a2-c7b636a8383a',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
  $aliases['letsgrowkids.dev'] = array(
    'uri' => 'dev-letsgrowkids.pantheonsite.io',
    'db-url' => 'mysql://pantheon:ff128733724c43c3b1bb5c8cd5ec3701@dbserver.dev.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in:22015/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.dev.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in',
    'remote-user' => 'dev.df95dea1-6ca7-4412-88a2-c7b636a8383a',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
  $aliases['letsgrowkids.test'] = array(
    'uri' => 'test-letsgrowkids.pantheonsite.io',
    'db-url' => 'mysql://pantheon:e982e22f8b9441b1a8d4230898f6305d@dbserver.test.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in:14798/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.test.df95dea1-6ca7-4412-88a2-c7b636a8383a.drush.in',
    'remote-user' => 'test.df95dea1-6ca7-4412-88a2-c7b636a8383a',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
  $aliases['ahillio.live'] = array(
    'uri' => 'live-ahillio.pantheonsite.io',
    'db-url' => 'mysql://pantheon:b43eec2ba92044a49695721009c28097@dbserver.live.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in:13467/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.live.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in',
    'remote-user' => 'live.e30b7b37-216a-4aae-8037-b63d08132c7c',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
  $aliases['ahillio.dev'] = array(
    'uri' => 'dev-ahillio.pantheonsite.io',
    'db-url' => 'mysql://pantheon:7f54691ad2b24dd0b2cf1ca56ea80e55@dbserver.dev.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in:23515/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.dev.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in',
    'remote-user' => 'dev.e30b7b37-216a-4aae-8037-b63d08132c7c',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
  $aliases['ahillio.test'] = array(
    'uri' => 'test-ahillio.pantheonsite.io',
    'db-url' => 'mysql://pantheon:fe00d9f80d454a58b14d1fd3b233a6e5@dbserver.test.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in:14438/pantheon',
    'db-allows-remote' => TRUE,
    'remote-host' => 'appserver.test.e30b7b37-216a-4aae-8037-b63d08132c7c.drush.in',
    'remote-user' => 'test.e30b7b37-216a-4aae-8037-b63d08132c7c',
    'ssh-options' => '-p 2222 -o "AddressFamily inet"',
    'path-aliases' => array(
      '%files' => 'code/sites/default/files',
      '%drush-script' => 'drush',
     ),
  );
