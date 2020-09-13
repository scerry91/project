# groups::config class
class groups::config () {

  # Getting vars from data/common.yaml file
  $group = lookup("group")

  # Creating a new group
  group { $group['name']:
    gid => $group['id'],
    ensure => $group['state'],
  }
}


