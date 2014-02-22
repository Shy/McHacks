post '/twitter' do
  puts params.inspect
  if params == {}
    { success: 200 }.to_json
  end
end
