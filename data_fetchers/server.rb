require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

require_relative './twilio.rb'
require_relative './sendgrid.rb'
