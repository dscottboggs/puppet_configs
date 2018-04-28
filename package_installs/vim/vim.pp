package { 'vim':
  ensure => latest,
}
file { '/home/scott/.vimrc':
  ensure  => file,
  mode    => '0644',
  user    => 1000,
  group   => 1000,
  content => template("${puppet_dir}/package_installs/vim/vimrc.txt")
}
