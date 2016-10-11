module ApplicationHelper

  # Converts DateTime object to human readable format
  def convert_time(datetime)
    datetime.to_formatted_s(:long)
  end

  # Shortens given text if it's too long to display
  def shorten(text)
    if text.length > 50
      text[0...50] + '...'
    else
      text
    end
  end

end
