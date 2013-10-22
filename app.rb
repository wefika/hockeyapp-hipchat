#!/usr/bin/env ruby

require 'sinatra'
require 'dotenv'
require 'httparty'
require 'oj'
Dotenv.load

def post_to_hipchat message="No message"
  HTTParty.post("https://api.hipchat.com/v1/rooms/message", query: {
    auth_token: ENV["HC_AUTH_TOKEN"],
    room_id: ENV["HC_ROOM_ID"],
    from: ENV["HC_FROM"],
    message: message,
    color: "purple"
  })
end

post '/webhook' do
  request.body.rewind
  @body = Oj.load(request.body.read)

  post_to_hipchat "#{@body["title"]} <a href=\"#{@body['url']}\">#{@body['url']}</a>"

  "ok"
end

