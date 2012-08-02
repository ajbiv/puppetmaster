class aws {

class base {

package { "git" : ensure => installed }
exec { "dpkg-reconfigure dash":  
   path => ["/usr/bin", "/usr/sbin", "/bin", "/usr/local/bin" ],
}

}

class rvm {
# need git


# required for rvm
package { "git-core" : ensure => installed }
package { "build-essential" : ensure => installed }
package { "curl" : ensure => installed }




file { "installrvm.sh":
   path => "/tmp/installrvm.sh",
   source => "puppet:///modules/aws/installrvm.sh",
}

exec { "bash installrvm.sh":
   cwd => "/tmp",
   path => ["/usr/bin", "/usr/sbin", "/bin", "/usr/local/bin" ],
   require =>  File['installrvm.sh'] ,
}


}

class ruby {

  include aws::rvm

  # required for rvm to install ruby
  package { "ree" : ensure => installed }
  package { "patch" : ensure => installed }
  package { "zlib1g-dev" : ensure => installed }

  file { "installruby.sh":
     path => "/tmp/installruby.sh",
     source => "puppet:///modules/aws/installruby.sh",
  }
 
  exec { "bash installruby.sh":
   cwd => "/tmp",
   path => ["/usr/bin", "/usr/sbin", "/bin", "/usr/local/bin" ],
   require =>  File['installruby.sh'] ,
  }
}


}

