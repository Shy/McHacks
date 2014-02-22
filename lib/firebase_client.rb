require 'rubygems'
require 'firebase'

class FirebaseClient
  class << self
    def configure(base_url, secret_key)
      @base_url = base_url
      @secret_key = secret_key
    end

    def add_message(message)
      add_record('submissions', message)
    end

    private

    def add_record(scope, object)
      client.push(scope, object)
    end

    def client
      @client ||= Firebase.new(@base_url, @secret_key)
    end
  end
end

FirebaseClient.configure('https://everyoneplayspokemon.firebaseIO.com', 'XZGCCf9UmXDjyrUmHGBYWyCytJhWw61XShvEzbBD')
