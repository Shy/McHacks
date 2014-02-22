post '/twitter' do
  puts params.inspect
  if params == {}
    { success: true }.to_json
  end
end
