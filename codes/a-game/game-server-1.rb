#! /usr/bin/env ruby

require 'socket'
require 'json'
require_relative File.join *%w( lib server client )

class GameSever

  SERVER_PORT     = 9000
  CYCLE_TIME      = 1

  CLIENTS    = [{}]
  Thread.new do
    Socket.udp_server_loop(SERVER_PORT) do |msg, msg_src|
      remote  = msg_src.remote_address
      ip      = remote.ip_address
      data    = JSON.parse(msg)
      port    = data["port"]
      clients = CLIENTS.last.clone
      client  = Client.new data["conf"], ip, port, ClientReq.new, data["win_width"], data["win_height"]
      key     = client.ident
      clients[key] ||= client
      clients[key].req.add_mvmts data["mvmt"]
      CLIENTS << clients
    end
  end

  # Placeholder:
  #   Update the state of the world,
  #   and push to clients
  
end
