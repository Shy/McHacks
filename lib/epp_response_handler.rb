require_relative 'epp_text_analyzer.rb'
require_relative 'firebase_client.rb'

class EppResponseHandler
  def self.handle!(text, source, extra_data = {})
    FirebaseClient.add_message(
      EppTextAnalyzer.analyze_with_timestamp_and_source(text, Time.now.to_i, source).merge(extra_data)
    )
  end
end
