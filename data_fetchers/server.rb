require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

require_relative './twitter.rb'
require_relative './twilio.rb'
