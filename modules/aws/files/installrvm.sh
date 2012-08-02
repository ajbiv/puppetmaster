#!/bin/sh

userhome=/root

bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo '[[ -s "${userhome}/.rvm/scripts/rvm" ]] && source "${userhome}/.rvm/scripts/rvm"' >> ${userhome}/.bashrc
echo '[[ -s "${userhome}/.rvm/scripts/rvm" ]] && source "${userhome}/.rvm/scripts/rvm"' >> ${userhome}/.bashrc
source ${userhome}/.bashrc
${userhome}/.rvm/bin/rvm notes

