class HomeController < ApplicationController
  def index
    render json: time
  end

  private
  def time
    {
      "status": :ok
    }
  end
end
