require_relative '../lib/epp_response_handler.rb'

post '/sendgrid' do
  EppResponseHandler.handle!(params['subject'], 'sendgrid')
  {}.to_json
end
