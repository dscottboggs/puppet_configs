user { 'scott':
  ensure  => 'present',
  comment => 'D. Scott Boggs',
  groups  => ['adm',
    'cdrom',
    'sudo',
    'dip',
    'plugdev',
  ],
  uid     => '1000',
  gid     => '1000',
  home    => '/home/scott',
  shell   => '/bin/zsh'
}
user { 'root':
  ensure => 'present',
  gid    => '0',
  home   => '/root',
  shell  => '/bin/bash',
  uid    => '0',
}
