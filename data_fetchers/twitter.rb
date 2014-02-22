require 'rubygems'
require 'redis'
require 'json'

redis = Redis.new(timeout: 0)

list = redis.get('tweets')
puts list
