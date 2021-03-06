include apt

if $::osfamily == 'Debian' {
  package { 'ca-certificates':
    ensure => latest,
  }
  #package { 'curl':
  #  ensure => latest,
  #}	# handled by my user manifest already
  package { 'gnupg2':
    ensure => latest,
  }
  package { 'software-properties-common':
    ensure => latest,
  }
  package { 'dirmngr':
    ensure => latest,
  }
  apt::source { 'docker-ce':
    comment  => 'The official docker repository.',
    location => 'https://download.docker.com/linux/debian',
    release  => $facts['os']['lsb']['distcodename'],
    repos    => 'stable',
    key      => {
      id      => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      options => 'https://download.docker.com/linux/debian/gpg',
    },
    include  => {
      'src' => false,
      'deb' => true
    }
  }
  exec { 'update-apt':
    command => '/usr/bin/apt-get update',
  }
  package { 'docker-ce':
    ensure => latest,
  }
}
