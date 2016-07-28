class HomeController < ApplicationController
  def index
    timestamp = params[:timestamp]

    if timestamp.to_i == 0
      @timestamp = Timestamp.new timestamp
    else
      @timestamp = Timestamp.new timestamp.to_i
    end

    render json: time
  end

  private
  def time
    {
      natural: @timestamp.natural,
      unix:    @timestamp.unix,
      status:  :ok
    }.as_json
  end
end
