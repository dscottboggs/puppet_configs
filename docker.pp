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
      id     => '9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88',
      server => 'https://download.docker.com/linux/debian/gpg',
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
