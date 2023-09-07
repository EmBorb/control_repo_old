class profile::ssh_server {
        package {'openssh-server':
                ensure => present,
        }
        service { 'sshd':
                ensure => 'running',
                enable => 'true',
        }
        ssh_authorized_key { 'root@master.puppet2.vm':
              ensure => present,
              user   => 'root',
              type   => 'ssh-rsa',
              key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDPOPCRvtjrY2XpK3EL3cgRProMJifh51EozwMfWs7Xwc/AQ8lrj159w/f+JX62vtMbp/f0wMeAMv1AJisBwPoYfOpobY41wBqhFsSwGvQ49haaQoCTiP1daLKMGbPB0+9pwhyuJ6ujLZ+cRRrTwiK8PgaxmCxt/Qd3yIb533i080it3vDti116wCpE9giLedbyRRkfsU2FNvFVfhN9kwbeMDto2Rxgw6y9A7sqMtFTQF4cAZx4k6l+J8Q4AduvnDj8ZDK3hIFyXjHySmYeak2kyxk1P9gD59tZTYUsOtD0OaTw499QigFTealzSFbDga5Mw+R2DZ2a1lAwQywu4iup',
        }
}
