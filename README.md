# DESCRIPTION
    Puppet modules to clean up disk space on the system, tested with puppet version "6.18.0"
   
# OVERVIEW
    - Create a new group
    - Create n aew user and assign to the group
    - Add Cron Job to clean the oldest logs if we are running out of disk space

# HOW TO USE
VARIABLES:
data/common.yaml
 
    # Create a new group
    group:
      name: appgroup
      id: 3021
      state: present

    # Create a new user and assign to the group
    user:
      name: appuser
      group: appgroup

    # Create a log directory and give group perms
    directory:
      path: /var/log/applogs
      group: appgroup
      mode: 774

    # Setup cron job to check & clean disk space every 10min
    clean_log_files:
      log_directory: /var/log/applogs/log-*.gzip
      max_percentage_taken: 95
      src_script: cleaning_script.sh
      dest_script: /opt/scripts/
      user: appuser
      minute: '*/10'
      group: appgroup

Manifest for Node:

    # Default node
    node default {}

    # puppet-agent1 server
    node 'puppet-agent1.v3eim54fbvuuzfqst3arrscrga.zx.internal.cloudapp.net' {

      # Including appserver role
      include role::appserver

    }

Hierra Configuration to get yaml variables:
/etc/puppetlabs/puppet/hiera.yaml

    ---
    :backends:
      - yaml
    :yaml:
      :datadir: /etc/puppetlabs/code/environments/production/data
    :hierarchy:
      - common


