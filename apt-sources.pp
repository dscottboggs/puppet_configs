$home_folder = '/home/scott'
$puppet_dir = "${home_folder}/puppet"
$sourcefile = "${puppet_dir}/sources.list.erb"

if  $::kernel == 'linux' {
  if $::osfamily == 'Debian' {
    if $software_platform == 'Ubuntu'{
      $mirror='http://us.archive.ubuntu.com/ubuntu/'
      $suites='main restricted universe multiverse'
    }
    elsif $software_platform == 'Debian' {
      $mirror='http://ftp.us.debian.org/debian/'
      $suites='main contrib non-free'
    }
    file { '/etc/apt/sources.list':
      ensure  => file,
      mode    => '0644',
      content => template($sourcefile)
    }
  }
