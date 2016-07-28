class HomeController < ApplicationController
  def index
    begin
      create_timestamp(params[:timestamp])
      render json: time
    rescue ArgumentError => e
      flash[:error] = e.message
      render nothing: true, status: :unprocessable_entity
    end
  end

  private
  def create_timestamp(timestamp)
    if timestamp.to_i == 0
      @timestamp = Timestamp.new timestamp
    else
      @timestamp = Timestamp.new timestamp.to_i
    end
  end

  def time
    {
      natural: @timestamp.natural,
      unix:    @timestamp.unix,
      status:  :ok
    }.as_json
  end
end
