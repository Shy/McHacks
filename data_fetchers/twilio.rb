require_relative '../lib/epp_response_handler.rb'

post '/twilio' do
  EppResponseHandler.handle!(params['Body'], 'twilio', { sender: params['From']})
  {}.to_json
end
