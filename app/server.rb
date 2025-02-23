require 'socket'
require_relative 'dns/header'
require_relative 'dns/server'

DNS::Server.new(host: '0.0.0.0', port: 2053).start
