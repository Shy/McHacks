require_relative '../lib/epp_response_handler.rb'

post '/twilio' do
  EppResponseHandler.handle!(params['Body'], 'twilio')
  {}.to_json
end
