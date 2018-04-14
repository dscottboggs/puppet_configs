include apt

if $::osfamily == 'Debian' {
  package { 'apt-transport-https':
    ensure => latest,
  }
  package { 'ca-certificates':
    ensure => latest,
  }
  package { 'curl':
    ensure => latest,
  }
  package { 'gnupg2':
    ensure => latest,
  }
  package { 'software-properties-common':
    ensure => latest,
  }
  apt::source { 'docker-ce':
    comment  => 'The official docker repository.',
    location => 'https://download.docker.com/linux/debian',
    release  => $facts['os']['lsb']['distcodename'],
    repos    => 'stable',
    key      => {
      id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      server => 'https://download.docker.com',
    },
    include  => {
      'src' => false,
      'deb' => true
    }
  }
  package { 'docker-ce':
    ensure => latest,
  }
}
