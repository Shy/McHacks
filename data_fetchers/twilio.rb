post '/twilio' do
  EppResponseHandler.handle!(params['Body'], 'twilio')
  {}.to_json
end
