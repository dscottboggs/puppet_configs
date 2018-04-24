node 'default' {
  notice('the fact is on the next line')
  notice($facts['os']['lsb']['distcodename'])
}
