# Default node
node default {}

# puppet-agent1 server
node 'puppet-agent1.v3eim54fbvuuzfqst3arrscrga.zx.internal.cloudapp.net' {

  # Including appserver role
  include role::appserver

}


