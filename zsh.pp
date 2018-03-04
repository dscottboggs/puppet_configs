$home_folder = '/home/scott'
$puppet_dir = "${home_folder}/puppet"

package { 'zsh':
  ensure => installed,
}
file { "${home_folder}/.zshrc":
  ensure  => present,
  group   => '1000',
  owner   => '1000',
  mode    => '0644',
  content => template("${puppet_dir}/zshrc.erb")
}
vcsrepo { "${home_folder}/.oh-my-zsh":
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/robbyrussell/oh-my-zsh.git'
}
