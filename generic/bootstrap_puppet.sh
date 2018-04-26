#!/usr/bin/env bash
apt-get install -y puppet
puppet module install puppetlabs-vcsrepo
git clone https://github.com/dscottboggs/puppet_configs.git
