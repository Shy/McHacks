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
      it 'should count the as properly' do
        subject[:a].should == 5
      end

      it 'should count the bs properly' do
        subject[:b].should == 2
      end

      it 'should not have any "start" strings' do
        subject[:start].should == 0
      end

      it 'should include the source' do
        subject[:source].should == 'Twitter'
      end
    end
  end
end
