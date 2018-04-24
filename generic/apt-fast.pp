package { 'aria2':
  ensure => latest,
}
vcsrepo { '/tmp/apt-fast':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/ilikenwf/apt-fast'
}
file { '/usr/local/sbin/apt-fast':
  ensure => file,
  mode   => '0755',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/apt-fast'
}
file { '/etc/apt-fast.conf':
  ensure => file,
  mode   => '0644',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/apt-fast.conf'
}
file { '/usr/share/man/man8/apt-fast.8':
  ensure => file,
  mode   => '0644',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/man/apt-fast.8'
}
file { '/usr/share/man/man5/apt-fast.conf.5':
  ensure => file,
  mode   => '0644',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/man/apt-fast.conf.5'
}
file { '/usr/share/bash-completions/completions/apt-fast':
  ensure => file,
  mode   => '0644',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/completions/bash/apt-fast'
}
file { '/usr/share/zsh/functions/Completion/Zsh/_apt-fast':
  ensure => file,
  mode   => '0644',
  owner  => '0',
  group  => '0',
  source => '/tmp/apt-fast/completions/zsh/_apt-fast'
}
