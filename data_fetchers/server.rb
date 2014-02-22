require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 4567

require_relative './twilio.rb'
require_relative './sendgrid.rb'
