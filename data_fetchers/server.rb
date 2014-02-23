require 'sinatra'
require 'sinatra/cross_origin'

require 'json'

set :bind, '0.0.0.0'
set :port, 80

configure do
  enable :cross_origin
end

require_relative './static.rb'
require_relative './twilio.rb'
require_relative './sendgrid.rb'
require_relative './twitter.rb'
require_relative './ios.rb'
