require 'byebug'
class Timestamp
  attr_accessor :timestamp, :unix, :natural

  def initialize(timestamp)
    @timestamp = timestamp
    get_time
  end

  def get_time
    if timestamp.is_a? Integer
      @natural = Time.at(timestamp).utc.strftime("%B %d, %Y")
    else
    end
  end
end

RSpec.describe Timestamp do
  let(:unix_timestamp) { 1450137600 }
  let(:natural_timestamp) { "December 15, 2015"}

  context "given a unix timestamp" do
    it "returns the natural timestamp" do
      ts = Timestamp.new unix_timestamp
      expect(ts.natural).to eq natural_timestamp
    end
  end

  pending "give a natural timestamp" do
    it "returns the unix timestamp" do
      ts = Timestamp.new natural_timestamp
      expect(ts.unix).to eq unix_timestamp
    end
  end
end
