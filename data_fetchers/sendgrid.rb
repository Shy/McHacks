require_relative '../lib/epp_response_handler.rb'

post '/sendgrid' do
  puts params
  {}.to_json
end
