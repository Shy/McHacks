require_relative '../spec_helper'

describe EppTextAnalyzer do
  describe '::analyze_with_timestamp_and_source' do
    subject { EppTextAnalyzer.analyze_with_timestamp_and_source(text, timestamp, source) }
    let(:text) { nil }
    let(:timestamp) { Time.now.to_i }
    let(:source) { nil }

    context 'when the result is from a random tweet' do
      let(:text) { "Abra cadabra" }
      let(:source) { "Twitter" }
      it 'should determine the appropriate response' do
        subject[:action].should == 'a'
      end
      it 'should include the timestamp' do
        subject[:timestamp].should == timestamp
      end
    end
  end
end
