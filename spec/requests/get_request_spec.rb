require 'rails_helper'

RSpec.describe "Get Timestamp", type: :request do
  it "converts unix timestamp to natural language" do
    get "/", { timestamp: 1450137600 }
    expect(response.content_type).to  eq "application/json"
    expect(response).to have_http_status :ok
    parsed_json = JSON.parse response.body
    expect(parsed_json["natural"]).to eq "December 15, 2015"
  end

  it "converts natural language to unix timestamp " do
    get "/", { timestamp: "December 15, 2015" }
    expect(response.content_type).to  eq "application/json"
    expect(response).to have_http_status :ok
    parsed_json = JSON.parse response.body
    expect(parsed_json["unix"]).to eq 1450137600
  end

  it "throws a unprocessable entity for invalid date" do
    get "/", { timestamp: "Movember 32, 2015" }
    expect(response).to have_http_status :unprocessable_entity
  end
end
