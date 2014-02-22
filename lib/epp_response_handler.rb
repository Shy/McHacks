require_relative 'epp_text_analyzer.rb'

class EppResponseHandler
  def self.handle!(text, source)
    FirebaseClient.add_message(
      EppTextAnalyzer.analyze_with_timestamp_and_source(text, Time.now.to_i, source)
    )
  end
end
