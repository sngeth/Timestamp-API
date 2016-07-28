require 'rails_helper'

RSpec.describe Timestamp do
  let(:unix_timestamp) { 1450137600 }
  let(:natural_timestamp) { "December 15, 2015"}

  context "given a unix timestamp" do
    it "returns the natural timestamp" do
      ts = Timestamp.new unix_timestamp
      expect(ts.natural).to eq natural_timestamp
    end
  end

  context "given a natural timestamp" do
    it "returns the unix timestamp" do
      ts = Timestamp.new natural_timestamp
      expect(ts.unix).to eq unix_timestamp
    end
  end
end
