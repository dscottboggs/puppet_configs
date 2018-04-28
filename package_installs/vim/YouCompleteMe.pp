# mod('puppet-nodejs', '5.0.0')
# mod('puppetlabs-vcsrepo', '2.3.0')
# I think the in-file module definitions are just for like the 'pro' version.

package { 'build-essential':
  ensure => latest
}
package { 'cmake':
  ensure => latest
}
package { 'python-dev':
  ensure => latest
}
package { 'python-dev3':
  ensure => latest
}
package { 'jedi':
  ensure   => latest,
  provider => pip3
}
package { 'mono-runtime':
  ensure => latest
}
package { 'golang-1.10':
  ensure => latest
}
package { 'nodejs':
  ensure => latest
}
package { 'npm':
  ensure => latest
}
package { 'typescript':
  ensure   => latest,
  provider => npm
}
package { 'openjdk-8-jdk':
  ensure => latest
}
package { 'tsserver':
  ensure => latest
}
package { 'xbuild':
  ensure => latest
}
package { 'rustc':
  ensure => latest
}
package { 'cargo':
  ensure => latest
}
vcsrepo { "$home_folder/.vim/bundle/YouCompleteMe":
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/Valloric/YouCompleteMe.git'
}
exec { './install.py --all':
  cwd => "${home_folder}/.vim/bundle/YouCompleteMe"
}
