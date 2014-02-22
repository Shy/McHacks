class EppTextAnalyzer
  KEYS = %w[
    a
    b
    up
    down
    left
    right
    start
    stop
  ]

  def self.analyze_with_timestamp_and_source(text, timestamp, source)
    # Count the occurrences of 'a', 'b', 'up', 'down', 'left', 'right', 'start', and 'stop'
    text = clean(text)
    counts = {}
    KEYS.each do |key|
      counts.merge!(key.to_sym => text.scan(key).length)
    end
    max = counts.values.max
    response = Hash[counts.select { |k, v| v == max}]
    response.merge!(timestamp: timestamp)
    response
  end

  def self.clean(text)
    # Clean up the text to be analyzed in place
    text.downcase.gsub(" #everybodyplayspokemon", '')
  end
end
