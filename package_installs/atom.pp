include apt

apt::source { 'atom':
  comment  => "The repository for github's Atom.",
  key      => {
    options => 'https://packagecloud.io/AtomEditor/atom/gpgkey',
    id      => '0A0FAB860D48560332EFB581B75442BBDE9E3B09'
  },
  location => 'https://packagecloud.io/AtomEditor/atom/any/',
  release  => 'any',
  repos    => 'main',
  include  => {
    'deb' => true,
    'src' => false
  }
}
package { 'atom':
  ensure => latest,
}
