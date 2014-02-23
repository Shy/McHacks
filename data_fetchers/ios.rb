require_relative '../lib/epp_response_handler.rb'

post '/ios' do
  EppResponseHandler.handle!(params['direction'], 'mobile')
  {}.to_json
end
