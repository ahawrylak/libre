module ApplicationHelper

  def convert_time(datetime)
    datetime.to_formatted_s(:long)
  end

end
