# users::config class
class users::config () {

  # Getting vars from data/common.yaml

  $user = lookup("user")

  # Creating a new user and assigning to the group
  user { $user['name']:
    groups     => [$user['group']],
    membership => minimum,
  }
}


