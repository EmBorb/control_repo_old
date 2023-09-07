class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/server.jar':
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar'
  }
  file {'/opt/minecraft/java.rpm':
    ensure => file,
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
  }
   package { 'java':
     provider => 'rpm',
     ensure   => 'present',
     source   => '/opt/minecraft/java.rpm',
 }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
