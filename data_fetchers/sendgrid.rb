require_relative '../lib/epp_response_handler.rb'
require 'mail'

Mail.defaults do
  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "everyoneplayspokemon.com",
                           :user_name => "jberlinsky@gmail.com",
                           :password  => "601845",
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

post '/sendgrid' do
  EppResponseHandler.handle!(params['subject'], 'sendgrid', { sender_email: params['from'] })
  {}.to_json
end

post '/back_email' do
  response['Access-Control-Allow-Origin'] = '*'
  response['Access-Control-Request-Method'] = '*'
  content_type :json
  Mail.deliver do
    to params['recipient']
    from 'Everyone Plays Pokemon <move@everyoneplayspokemon.com>'
    subject 'Pokemon Game State'
    text_part do
      body 'You need to enable HTML emails to see the current game state'
    end
    html_part do
      content_type 'text/html; charset=UTF-8'
      body "<img src='#{params['canvas_dump']}' />"
    end
  end
  {}.to_json

end
