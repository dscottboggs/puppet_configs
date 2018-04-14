include apt

package { 'apt-transport-https':
  ensure => installed,
}
apt::source { 'x2go':
  comment  => 'The x2go repository.',
  key      => {
    id     => '972FD88FA0BAFB578D0476DFE1F958385BFE2B6E',
    server => 'keys.gnupg.net'
  },
  location => 'https://packages.x2go.org/debian',
  release  => $facts['os']['lsb']['distcodename'],
  repos    => 'extras main',
  include  => {
    'src' => false,
    'deb' => true
  }
}
exec { 'apt-update':
  command => 'apt-get update',
  path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}
package { 'x2go-keyring':
  ensure => latest,
}
exec { 'apt-update':
  command => 'apt-get update',
  path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}
package { 'x2goserver':
  ensure => latest,
}
package { 'x2goserver-xsession':
  ensure => latest,
}
package { 'x2godesktopsharing':
  ensure => latest,
}
