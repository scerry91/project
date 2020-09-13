# appserver role
class role::appserver {

  # Including groups class
  include groups

  # Including users class
  include users

  # Including directory class
  include directory

  # Including clean_log_file class
  include clean_log_file

}

