class minecraft (
  $url = 'https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar',
  $install_dir = '/opt/minecraft'
){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  file {"${install_dir}/java.rpm":
    ensure => file,
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
  }
   package { 'java':
     provider => 'rpm',
     ensure   => 'present',
     source   => "${install_dir}/java.rpm",
 }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']]
  }
}
