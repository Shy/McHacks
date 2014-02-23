require_relative '../lib/epp_response_handler.rb'

post '/twitter' do
  puts params.inspect
  puts "======="
  puts request.inspect
  if params == {}
    { success: true }.to_json
  end
end
