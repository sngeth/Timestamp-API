require 'rails_helper'

RSpec.describe "Get Timestamp", type: :request do
  it "receives a unix timestamp" do
    get "/"
    expect(response.content_type).to  eq "application/json"
    expect(response).to have_http_status :ok
    #expect(response).to eq '{"unix": 1450137600, "natural": "December 15, 2015"}'
  end
end
