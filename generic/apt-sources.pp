$home_folder = '/home/scott'
$puppet_dir = '/root/puppet_configs'
$sourcefile = "${puppet_dir}/generic/sources.list.erb"
$release = $lsbdistcodename

if  $::kernel == 'linux' {
  if $::osfamily == 'Debian' {
    if $lsbdistid == 'Ubuntu'{
      $mirror='http://us.archive.ubuntu.com/ubuntu/'
      $suites='main restricted universe multiverse'
      notice("Mirror: ${mirror}\nSuites: ${suites}\nRelease: ${release}")
    }
    elsif $lsbdistid == 'Debian' {
      $mirror='http://ftp.us.debian.org/debian/'
      $suites='main contrib non-free'
      notice("Mirror: ${mirror}\nSuites: ${suites}\nRelease: ${release}")
    }
  }
}
file { '/etc/apt/sources.list':
  ensure  => file,
  mode    => '0644',
  content => template($sourcefile)
}
