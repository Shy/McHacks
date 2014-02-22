post '/twitter' do
  EppResponseHandler.handle!(params['text'], 'twitter')
  {}.to_json
end
