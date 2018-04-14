Facter.add('hardware_platform') do
  setcode do
    Facter::Core::Execution.execute('/bin/uname --hardware-platform')
  end
end
Facter.add('software_platform') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/lsb_release --short --id')
  end
end
Facter.add('software_release_name') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/lsb_release --short --codename')
  end
end
Facter.add('software_release_number') do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/lsb_release --short --release')
  end
end
