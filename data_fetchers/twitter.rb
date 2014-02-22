require 'rubygems'
require 'redis'
require 'json'

redis = Redis.new(timeout: 0)

puts "Getting ready to subscribe"
redis.subscribe('tweets') do |on|
  puts "Loop"
  on.subscribe do |channel, subscriptions|
    puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
  end
  on.message do |channel, msg|
    puts msg
    data = JSON.parse(msg)
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
