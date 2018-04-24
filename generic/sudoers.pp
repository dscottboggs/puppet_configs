$home_folder = '/home/scott'
$puppet_dir = "${home_folder}/puppet"
group { 'sudo':
  ensure => 'present',
  gid    => '27',
}
package { 'sudo':
  ensure => installed,
}
file { '/etc/sudoers':
  ensure  => file,
  mode    => '0640',
  group   => '0',
  owner   => '0',
  content => "# sudoers file
# this file is managed by puppet. Do not edit.
# see `man 5 sudoers` for information on this config,
# edit it in ${puppet_dir}/sudoers.pp to change the options.
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"
root            ALL=(ALL:ALL) ALL
%sudo           ALL=(ALL:ALL) ALL
"
}
