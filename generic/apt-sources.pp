$mirror_link = {
  'Ubuntu' => 'http://us.archive.ubuntu.com/ubuntu/',
  'Debian' => 'http://ftp.us.debian.org/debian/'
}

$distro_suites = {
  'Ubuntu' => 'main restricted universe multiverse',
  'Debian' => 'main contrib non-free'
}
$signing_keys = {
  'Debian' => {
    'updates' => {
      source => 'https://ftp-master.debian.org/keys/archive-key-9.asc',
      id     => 'E1CF20DDFFE4B89E802658F1E0B11894F66AEC98'
    },
    'security' => {
      source => 'https://ftp-master.debian.org/keys/archive-key-9-security.asc',
      id     => '6ED6F5CB5FA6FB2F460AE88EEDA0D2388AE22BA9'
    }
  },
  'Ubuntu' => {
    'updates' => {
      source => 'https://keyserver.ubuntu.com',
      id     => '630239CC130E1A7FD81A27B140976EAF437D05B5'
    },
    'security' => {
      source => 'https://keyserver.ubuntu.com',
      id     => '630239CC130E1A7FD81A27B140976EAF437D05B5'
    }
  }
}

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
