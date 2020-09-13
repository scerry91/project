# clean_log_file::config class
class clean_log_file::config () {

  # Getting vars from data/common.yaml file
  $log_file = lookup("clean_log_files")

  # Creating a script directory
  file { $log_file['dest_script']:
    ensure  => directory,
  }

  # Copying cleaning script
  file { "${log_file['dest_script']}${log_file['src_script']}":
    ensure  => file,
    content => epp("clean_log_file/${log_file['src_script']}", {'log_file' => $log_file}),
    mode => '774',
    group  => $log_file['group'],
  }

  # Setting up cron job
  cron { $log_file['dest_script']:
  command => $log_file['dest_script'],
  user    => $log_file['user'],
  minute  => $log_file['minute'],
  }

}



#"chmod ${directory['mode']} ${directory['path']}",
