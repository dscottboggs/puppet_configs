# Miscellaneous setup for my user

$important_packages_cli = [
    # specifically stuff that's important to me in a CLI environment
  'rsync', 'git', 'curl', 'wget', 'nano', 'htop'
]
$home_folder = '/home/scott'
$puppet_dir = "${home_folder}/puppet"

package { $important_packages_cli:
  ensure => installed
}

user { 'scott':
  ensure  => present,
  comment => 'D. Scott Boggs',
  groups  => ['adm',
    'cdrom',
    'sudo',
    'dip',
    'plugdev',
  ],
  uid     => '1000',
  gid     => '1000',
  home    => $home_folder,
  shell   => '/bin/zsh'
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
  content => template("${puppet_dir}/gitconfig.erb")
}
