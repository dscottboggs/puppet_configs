$home_folder = '/home/scott'
$puppet_dir = '/root/puppet'

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
file { "${home_folder}/.oh-my-zsh/themes/dscottboggs.zsh-theme":
  ensure  => file,
  mode    => '0644',
  owner   => '1000',
  group   => '1000',
  content => template("${puppet_dir}/zsh_theme.erb")
}
