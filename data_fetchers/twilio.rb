require_relative '../lib/epp_response_handler.rb'

require 'twilio-ruby'

$TWILIO_SID = 'AC296e9cb4aab9b5517287d956e8114c2e'
$TWILIO_AUTH_TOKEN = '8e0e1c7bbae2190ebe73330bed92353f'
$TWILIO_NUMBER_MMS = '+14506007452'
client = Twilio::REST::Client.new($TWILIO_SID, $TWILIO_AUTH_TOKEN)
from = $TWILIO_NUMBER_MMS

post '/twilio' do
  EppResponseHandler.handle!(params['Body'], 'twilio', { sender_phone: params['From']})
  {}.to_json
end

# Send back an MMS of the game state when possible
post '/back_mms' do
  response['Access-Control-Allow-Origin'] = '*'
  recipient_number = params['recipient']
  client.account.messages.create(
    from: from,
    to: recipient_number,
    body: 'Current game state',
    media_url: params['canvas_dump']
  )
  {}.to_json
end
