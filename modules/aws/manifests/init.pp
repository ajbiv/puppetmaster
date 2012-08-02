class aws {


# need git
package { "git" : ensure => installed }


# required for rvm
package { "git-core" : ensure => installed }
package { "build-essential" : ensure => installed }
package { "curl" : ensure => installed }


#package { "ree" : ensure => installed }
#package { "patch" : ensure => installed }
#package { "zlib1g-dev" : ensure => installed }


exec { "bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)":
   cwd => "/tmp",
   path => ["/usr/bin", "/usr/sbin", "/bin", "/usr/local/bin" ],
}


}

