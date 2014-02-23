require_relative '../lib/epp_response_handler.rb'

post '/twitter' do
  EppResponseHandler.handle!(params['content'], 'twitter')
  {}.to_json
end
