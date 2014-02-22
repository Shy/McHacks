require 'rubygems'
require 'redis'
require 'json'

redis = Redis.new(timeout: 0)

redis.subscribe('tweets') do |on|
  on.subscribe do |channel, subscriptions|
    puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
  end
  on.message do |channel, msg|
    puts msg
    data = JSON.parse(msg)
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
