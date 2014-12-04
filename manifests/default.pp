Package {
  ensure  => latest,
  require => Exec['apt-get update'],
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

# My packages
package  { [
  "tree",
  "vim",
  "git",
]:
}

# Dev packages
package  { [
  "leiningen",
]:
}

File {
  ensure => file,
}

file { "/root/.bashrc":
  content => file('puppetdb/bashrc')
}

file { "/root/.profile":
  content => file('puppetdb/profile')
}

file { "/root/.vimrc":
  content => file('puppetdb/vimrc')
}

file { [
  '/root/.vim',
  '/root/.vim/backups',
  '/usr/class',
  '/root/downloads',
]:
  ensure => directory,
  owner  => 'root',
}
