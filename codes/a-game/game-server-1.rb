#! /usr/bin/env ruby

require 'socket'
require 'json'
require_relative File.join *%w( lib server client )

class GameSever

  SERVER_PORT     = 9000
  CYCLE_TIME      = 1

  @client_updates = [{}]
  Thread.new do
    Socket.udp_server_loop(SERVER_PORT) do |msg, msg_src|
      # Get data about the client
      remote  = msg_src.remote_address
      ip      = remote.ip_address
      data    = JSON.parse(msg)
      port    = data["port"]

      # Make a new client to keep track of
      client  = Client.new data["conf"], ip, port, ClientReq.new, data["win_width"], data["win_height"]
      key     = client.ident

      # Copy the last client state, update and push it.
      clients = @client_states.last.clone
      clients[key] ||= client
      clients[key].req.add_mvmts data["mvmt"]
      @client_states << clients
    end
  end

  # Placeholder:
  #   Update the state of the world,
  #   and push to clients
  
end
