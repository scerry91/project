# directory::config class
class directory::config () {

  # Getting vars from data/common.yaml file  
  $directory = lookup("directory")

  # Creating a directory
  file { $directory['path']:
    path => $directory['path'],
    ensure => directory,
    owner  => $directory['owner'],
    group  => $directory['group'],
  }

  # Changing perms of directory as file module doesn't want to
  exec { 'change perm':
    command => "chmod ${directory['mode']} ${directory['path']}",
    path => ['/usr/bin', '/usr/sbin', '/bin'],
  }

}

