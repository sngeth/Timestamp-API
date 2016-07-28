class Timestamp
  attr_accessor :timestamp, :unix, :natural

  def initialize(timestamp)
    @timestamp = timestamp
    get_time
  end

  def get_time
    if timestamp.is_a? Integer
      @natural = Time.at(timestamp).utc.strftime("%B %d, %Y")
      @unix = timestamp
    else
      @unix = DateTime.new(parse_year, parse_month, parse_day).strftime("%s").to_i
      @natural = timestamp
    end
  end

  private
  def parse_year
    Date.parse(timestamp).year
  end

  def parse_month
    Date.parse(timestamp).month
  end

  def parse_day
    Date.parse(timestamp).day
  end
end
