#! /usr/bin/env ruby

require 'socket'
require 'json'
require_relative File.join *%w( lib server client )

class GameSever

  SERVER_PORT     = 9000
  CYCLE_TIME      = 1

  CLIENTS    = [{}]
  Thread.new do
    # Placeholder for client listen loop
  end

  STATES  = [{}]
  def self.calc_state
    clients = CLIENTS.last.clone
    states  = STATES.last.clone
    
    states_inited = clients.keys.inject(states) do |memo, client_ip|
      next memo if memo[client_ip]
      initial = clients[client_ip].clone
      memo.update({client_ip => initial})
    end
    moved_clients  = states_inited.merge(states_inited) do |key, ov|
      ov.calc_position(clients[key])
    end
    scored_clients = moved_clients.merge(moved_clients) do |key, ov|
      ov.calc_colision(moved_clients)
    end
    STATES << scored_clients
    scored_clients
  end

  game_loop = Thread.new do
    loop do
      clients = calc_state
      response = clients.map do |client_ip, client|
        client.calc_response.to_h
      end
      clients.each do |ip, client|
        sock = UDPSocket.new.tap{|s| s.connect(client.ip, client.port)}
        msg  = response.to_json
        sock.send(msg, 0)
      end
      sleep CYCLE_TIME
    end
  end

end
