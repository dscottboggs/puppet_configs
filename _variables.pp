$home_folder = '/home/scott'
$puppet_dir = '/root/puppet_configs'
$my_email = 'scott@tams.tech'
$important_packages_cli = [
    # specifically stuff that's important to me in a CLI environment
  'rsync', 'git', 'curl', 'wget', 'nano', 'htop'
]
$authorized_keys = 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICa1xQPW/kFnPrO51Mp5gWpEpRZO8d6vtrWxIIpOoFd4 scott@scotts-server'
$dns_address = '9.9.9.9'
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
