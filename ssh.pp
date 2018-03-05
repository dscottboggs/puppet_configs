$authorized_keys = 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICa1xQPW/kFnPrO51Mp5gWpEpRZO8d6vtrWxIIpOoFd4 scott@scotts-server'
$home_folder     = '/home/scott'
$puppet_dir      = '/root/puppet'
if $::osfamily == 'Archlinux' {
  package { 'openssh':
    ensure => installed,
  }
}else {
  package { 'openssh-server':
    ensure => installed,
  }
}
user { 'sshd':
  ensure  => present,
  comment => 'Secure Shell Daemon user',
  #gid     => '65534',   # represents "nogroup"
  home    => '/var/run/sshd',
  shell   => '/usr/sbin/nologin',
  uid     => '110'
}
file { '/etc/ssh/sshd_config':
  ensure  => file,
  group   => '0',
  owner   => '0',  # 0 means root
  mode    => '0644',
  content => template("${puppet_dir}/sshd_config.erb")
}
service { 'sshd':
  ensure => running,
  enable => true,
}
file { "${home_folder}/.ssh":
  ensure => directory,
  mode   => '0750',
  owner  => '1000',
  group  => '1000'
}
file { "${home_folder}/.ssh/authorized_keys":
  ensure  => present,
  group   => '1000',
  owner   => '1000',
  mode    => '0644',
  content => $authorized_keys,
}
