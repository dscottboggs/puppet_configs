#!/bin/bash
puppet_dir=/root/puppet_configs/
work_dir=$puppet_dir/package_installs
pkg_dir=$work_dir/$1
mkdir $pkg_dir
ln -s $puppet_dir/generic/*.pp $pkg_dir/
touch $pkg_dir/$1.pp
