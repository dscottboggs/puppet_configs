file { '/etc/resolv.conf':
  ensure  => file,
  mode    => '0644',
  group   => '0',
  owner   => '0',
  content => "nameserver ${dns_address}\n"
}
