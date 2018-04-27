apt::source { 'distro':
  comment  => 'The default repository for the distro.',
  location => $mirror_link[$lsbdistid],
  release  => $lsbdistcodename,
  repos    => $distro_suites[$lsbdistid],
  include  => {
    'deb' => true,
    'src' => true
  },
  key      => $signing_keys[$lsbdistid]['updates']
}

apt::source { 'distro-updates':
  comment  => 'The distro\'s "updates" repository.',
  location => $mirror_link[$lsbdistid],
  release  => "${lsbdistcodename}-updates",
  repos    => $distro_suites[$lsbdistid],
  include  => {
    'deb' => true,
    'src' => true
  },
  key      => $signing_keys[$lsbdistid]['updates']
}

apt::source { 'distro-security':
  comment  => 'The security updates repository for the distro.',
  location => $mirror_link[$lsbdistid],
  release  => "${lsbdistcodename}-security",
  repos    => $distro_suites[$lsbdistid],
  include  => {
    'deb' => true,
    'src' => true
  },
  key      => $signing_keys[$lsbdistid]['security']
}
