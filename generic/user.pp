# Miscellaneous setup for my user

$my_email = 'scott@tams.tech'
$important_packages_cli = [
    # specifically stuff that's important to me in a CLI environment
  'rsync', 'git', 'curl', 'wget', 'nano', 'htop'
]

package { $important_packages_cli:
  ensure => installed
}

group { 'scott':
  ensure => 'present',
  gid    => '1000',
}
user { 'scott':
  ensure  => present,
  comment => 'D. Scott Boggs',
  groups  => [
    'adm',
    'sudo',
  ],
  uid     => '1000',
  gid     => '1000',
  home    => $home_folder,
  shell   => '/bin/zsh'
}
file { '/home/scott':
  ensure => directory,
  mode   => '0755',
  group  => '1000',
  owner  => '1000'
}
user { 'root':
  ensure => present,
  gid    => '0',
  home   => '/root',
  shell  => '/bin/bash',
  uid    => '0',
}

# global git configuration
file { "${home_folder}/.gitconfig":
  ensure  => present,
  group   => '1000',
  owner   => '1000',
  mode    => '0644',
  content => "[user]
	email = ${my_email}
	name = scott"
}
