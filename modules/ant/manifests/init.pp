class core {


$working = "/opt/puppet/working"
file { $working:   ensure => directory }

class ant{
include core

file {"ant" :
   source => "puppet:///modules/core/ant.zip",
   ensure => "present",
   path => "${core::working}/ant.zip",
}


exec {"core-ant-go" :

  provider => "shell",
  cwd => "${core::working}",
  timeout => "0", 
  command => "unzip -o ant.zip; rm -v ant.zip",
  logoutput => true,
  path => "/bin:/usr/bin:/usr/local/bin:",
  require => [ File['ant'] ],
}

}

class jdk {
include core


file {"jdk" :
   source => "puppet:///modules/core/jdk1.5.0_21.zip",
   ensure => "present",
   path => "${core::working}/jdk.zip",
}


exec {"core-jdk-go" :

  provider => "shell",
  cwd => "${core::working}",
  timeout => "0", 
  command => "unzip -o jdk.zip; rm -v jdk.zip",
  logoutput => true,
  path => "/bin:/usr/bin:/usr/local/bin:",

}

}

}
